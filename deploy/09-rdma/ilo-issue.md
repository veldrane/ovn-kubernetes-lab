### IRQ conflict with ilo

[   92.805176] genirq: Flags mismatch irq 16. 00200000 (vfio-intx(0000:0a:00.0)) vs. 00200080 (hpilo)
[   92.806050] CPU: 1 UID: 107 PID: 2909 Comm: qemu-kvm Kdump: loaded Tainted: G          I E       6.18.3-1.el9.elrepo.x86_64 #1 PREEMPT(voluntary) 
[   92.806060] Tainted: [I]=FIRMWARE_WORKAROUND, [E]=UNSIGNED_MODULE
[   92.806062] Hardware name: HP ProLiant DL380p Gen8, BIOS P70 05/24/2019
[   92.806065] Call Trace:
[   92.806070]  <TASK>
[   92.806077]  dump_stack_lvl+0x62/0x80
[   92.806091]  __setup_irq+0x615/0x740
[   92.806105]  ? __pfx_vfio_intx_handler+0x10/0x10 [vfio_pci_core]
[   92.806123]  request_threaded_irq+0x10c/0x180
[   92.806132]  vfio_intx_enable+0xe7/0x1d0 [vfio_pci_core]
[   92.806144]  vfio_pci_set_intx_trigger+0x12d/0x260 [vfio_pci_core]
[   92.806155]  vfio_pci_core_ioctl+0xdb/0x460 [vfio_pci_core]
[   92.806168]  vfio_device_fops_unl_ioctl+0x7e/0x140 [vfio]
[   92.806183]  __x64_sys_ioctl+0x91/0xe0
[   92.806191]  ? syscall_trace_enter+0xf6/0x190
[   92.806198]  do_syscall_64+0x60/0x340
[   92.806204]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   92.806210] RIP: 0033:0x7ff6b5104c2b
[   92.806215] Code: ff ff ff 85 c0 79 9b 49 c7 c4 ff ff ff ff 5b 5d 4c 89 e0 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d bd 51 0f 00 f7 d8 64 89 01 48
[   92.806219] RSP: 002b:00007fffa47187f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   92.806224] RAX: ffffffffffffffda RBX: 0000563722026b40 RCX: 00007ff6b5104c2b
[   92.806227] RDX: 0000563722026b40 RSI: 0000000000003b6e RDI: 000000000000001b
[   92.806230] RBP: 0000563721f533d0 R08: 0000000000000000 R09: 00007ff6b40b4eb8
[   92.806232] R10: 0000000000000020 R11: 0000000000000246 R12: 0000000000000000
[   92.806235] R13: 00007ff6b40b4e30 R14: 00007ff6b40b4eb8 R15: 0000000000000020
[   92.806243]  </TASK>
[   92.849211] vnet2 (unregistering): left promiscuous mode
[   93.728494] pcieport 0000:00:1c.0: Enabling MPC IRBNCE
[   93.728823] pcieport 0000:00:1c.0: Intel PCH root port ACS workaround enabled
[root@dl380 ~]# lsmod | grep hpilo
hpilo                  20480  0
[root@dl380 ~]# rmmod hpilo

