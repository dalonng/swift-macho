import Foundation
import Darwin

/// https://opensource.apple.com/source/cctools/cctools-870/include/mach-o/loader.h.auto.html
struct LoadCommand {
  /// type of load command
  let cmd: UInt32

  /// total size of command in bytes
  let cmdsize: UInt32
}

struct SegmentCommand {
  /// type of load command
  let cmd: UInt32

  /// total size of command in bytes
  let cmdsize: UInt32

  ///segname[16];	segment name
  let segmentName: StaticString

  /// memory address of this segment
  let vmaddr: UInt64

  /// memory size of this segment
  let vmsize: UInt64

  /// file offset of this segment
  let fileoff: UInt64

  /// amount to map from the file
  let filesize: UInt64

  /// maximum VM protection
  let maxprot: vm_prot_t

  /// initial VM protection
  let initprot: vm_prot_t

  /// number of sections in segment
  let nsects: UInt32

  /// flags
  let flags: UInt32
}
