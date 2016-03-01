# baremetal-po-serial

A modification of Philipp Oppermann's [blog os post]
(http://os.phil-opp.com/multiboot-kernel.html) that uses
serial port rather than the vga display for output. Also,
it terminates by doing a reset of the cpu using a technique
derived from [The easiest way to reset i386/x86_64 system]
(http://www.pagetable.com/?p=140).

I use the following to write the image to a flash stick,
CAREFUL it can overwrite your Drive and you'll loose everything!!

  sudo dd bs=4M of=/dev/sdb if=build/os-x86_64.iso ; sync

I modified grub.conf to configure grub to use COM1 at 115200 baud
and then use a USB to serial port dongle and sreen to view the output

  sudo screen /dev/ttyUSB0 115200,cs8

The sources are originally from his [blog_os](https://github.com/phil-opp/blog_os)
and the contents from [src/arc/x86_64](https://github.com/phil-opp/blog_os/tree/master/src/arch/x86_64).
