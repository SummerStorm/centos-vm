# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "vagrant-centos66-desktop"
    config.vm.box = "centos66-desktop"
 
    config.vm.provider :virtualbox do |v, override|
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", 8192]
        v.customize ["modifyvm", :id, "--cpus", 4]
        v.customize ["modifyvm", :id, "--vram", "256"]
        v.customize ["setextradata", "global", "GUI/MaxGuestResolution", "any"]
        v.customize ["setextradata", :id, "CustomVideoMode1", "1024x768x32"]
        v.customize ["modifyvm", :id, "--ioapic", "on"]
        v.customize ["modifyvm", :id, "--rtcuseutc", "on"]
        v.customize ["modifyvm", :id, "--accelerate3d", "on"]
        v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    end

    ["vmware_fusion", "vmware_workstation"].each do |provider|
      config.vm.provider provider do |v, override|
        v.gui = true
        v.vmx["memsize"] = "8192"
        v.vmx["numvcpus"] = "4"
        v.vmx["cpuid.coresPerSocket"] = "4"
        v.vmx["ethernet0.virtualDev"] = "vmxnet3"
        v.vmx["RemoteDisplay.vnc.enabled"] = "false"
        v.vmx["RemoteDisplay.vnc.port"] = "5900"
        v.vmx["scsi0.virtualDev"] = "lsilogic"
	v.vmx["mks.enable3d"] = "TRUE"
      end
    end
end