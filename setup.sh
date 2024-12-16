#!/bin/bash

GOINFRE_DIR="/goinfre/$(whoami)"
USER_HOME="/home/$(whoami)"
ARCHIVE_NAME="$GOINFRE_DIR/arch_cli_osboxes.7z"
EXTRACTED_DIR="$GOINFRE_DIR/arch_cli_osboxes/64bit"
VDI_NAME="$EXTRACTED_DIR/ArchLinux 20240601 (64bit).vdi"
RAM_SIZE="4096"

echo "VirtualBox VM Manager Script"
echo "1. Setup VM"
echo "2. Delete VM and VDI"
echo "3. Delete only VDI"
echo "4. Exit"
read -p "Choose an option (1/2/3/4): " choice

download_arch_vdi() {
    echo "Downloading Arch Linux CLI VDI from OSBoxes..."
    if [ ! -f "$VDI_NAME" ]; then
        echo "VDI file not found. Checking archive..."
        
        if [ ! -f "$ARCHIVE_NAME" ]; then
            echo "Downloading Arch Linux CLI VDI from OSBoxes..."
            wget -O "$ARCHIVE_NAME" "https://sourceforge.net/projects/osboxes/files/v/vb/4-Ar---c-x/20240601/CLI/64bit.7z/download"
        else
            echo "Archive already downloaded: $ARCHIVE_NAME"
        fi

        while [ ! -f "$VDI_NAME" ]; do
            echo "File not found. Please extract the .7z archive first"
            echo "Open /goinfre/$(whoami) and double-clicking on the .7z file?"
            read -p "Choice: " yn
            if [ "$yn" == "y"]; then
                open "/goinfre/$(whoami)"
            elso
                echo "Make sure you extrac the file at /goinfre/$(whoami)" before continuing
            fi
            read -p "Press Enter after extracting the .7z file..."
        done
        echo "The virtual disk image is ready."
    else
        echo "VDI file already exists: $VDI_NAME"
    fi
}

setup_vm() {
    echo "Creating VirtualBox VM '$VM_NAME'..."
    VBoxManage createvm --name "$VM_NAME" --ostype "ArchLinux_64" --register
    VBoxManage modifyvm "$VM_NAME" --memory "$RAM_SIZE" --cpus 2 --nic1 nat
    VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAHCI
    VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$VDI_NAME"
    VBoxManage modifyvm "$VM_NAME" --audio-driver none
}

add_shared_folder() {
    echo "Adding shared folder..."
    read -p "Enter path to valid shared folder: $USER_HOME/" SHARED_FOLDER
    while [ ! -d "$USER_HOME/$SHARED_FOLDER" ]; do
        echo "Folder does not exist. Please provide a valid shared folder path."
        read -p "Enter path to valid shared folder: $USER_HOME/" SHARED_FOLDER
    done
    VBoxManage sharedfolder add "$VM_NAME" --name "shared" --hostpath "$USER_HOME/$SHARED_FOLDER" --automount
    VBoxManage setextradata "$VM_NAME" "VBoxInternal2/SharedFoldersEnableSymlinksCreate/$USER_HOME/$SHARED_FOLDER" 1
    echo "Shared folder added."
}

delete_vm_and_vdi() {
    read -p "Enter VM name to delete: " VM_NAME
    echo "Unregistering and deleting VM '$VM_NAME'..."
    VBoxManage unregistervm "$VM_NAME" --delete
    echo "VM '$VM_NAME' deleted."

    # Optionally delete VDI
    echo "Do you want to delete the VDI file as well? (y/n)"
    read -p "Choice: " delete_vdi
    if [ "$delete_vdi" == "y" ]; then
        if [ -f "$VDI_NAME" ]; then
            rm -f "$VDI_NAME"
            echo "VDI file deleted."
        else
            echo "VDI file not found. No action taken."
        fi
    else
        echo "VDI file not deleted."
    fi
}

delete_vdi_only() {
    if [ -f "$VDI_NAME" ]; then
        rm -f "$VDI_NAME"
        echo "VDI file deleted."
    else
        echo "VDI file not found. No action taken."
    fi
}

if [ "$choice" -eq 1 ]; then
    read -p "Enter VM name: " VM_NAME

    if VBoxManage list vms | grep -q "\"$VM_NAME\""; then
        echo "VM '$VM_NAME' already exists. Exiting setup. If installation failed, relaunch this script and select deletion before re-installing"
        exit 1
    fi

    download_arch_vdi
    setup_vm
    add_shared_folder
    VBoxManage startvm "$VM_NAME"
    echo "VM '$VM_NAME' has been set up and started."

    echo -e "\n-----------------------------------------"
    echo "Instructions for installing OCaml:"
    echo "1. Open the VM console or log into the VM."
    echo "2. Go to the shared folder directory."
    echo "   Use the following command to navigate:"
    echo "   cd /media/sf_shared"
    echo "3. Run the OCaml installation script:"
    echo "   ./install_ocaml.sh"
    echo -e "-----------------------------------------"

elif [ "$choice" -eq 2 ]; then
    delete_vm_and_vdi

elif [ "$choice" -eq 3 ]; then
    delete_vdi_only

elif [ "$choice" -eq 4 ]; then
    exit 1

else
    echo "Invalid choice. Exiting."
fi
