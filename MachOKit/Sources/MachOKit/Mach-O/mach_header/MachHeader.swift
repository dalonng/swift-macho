//
//  Header.swift
//  MachOKit
//
//  Created by d on 2023/3/14.
//

import Foundation

/// https://en.wikipedia.org/wiki/Mach-O#Multi-architecture_binaries
struct MachHeader {
  /// 4 bytes
  let magic: MagicNumber

  /// 4 bytes cpu specifier
  let cpuType: CpuType

  /// 4 bytes machine specifier
  ///   (ArmCpuSubype | i386CpuSubype)
  let cpuSubtype: UInt32

  /// 4 bytes file type
  let fileType: FileType

  /// 4 bytes Number of load commands
  let ncmds: UInt32

  /// 4 bytes The size of all the load commands
  let sizeofcmds: UInt32

  /// 4 bytes Flags
  let flags: Flags

  /// 4 bytes Reserved (64-bit only)
  let reserved: UInt32

  init(magic: MagicNumber, cpuType: CpuType, cpuSubtype: UInt32, fileType: FileType, ncmds: UInt32, sizeofcmds: UInt32, flags: Flags, reserved: UInt32) {
    self.magic = magic
    self.cpuType = cpuType
    self.cpuSubtype = cpuSubtype
    self.fileType = fileType
    self.ncmds = ncmds
    self.sizeofcmds = sizeofcmds
    self.flags = flags
    self.reserved = reserved
  }
}

extension MachHeader: CustomStringConvertible {
  public var description: String {
    var desc = ""
    desc += "magic: \(magic)\n"
    desc += "cpuType: \(cpuType)\n"
    if cpuType.isArm, let cst = ArmCpuSubtype(rawValue: cpuSubtype) {
      desc += "cpuSubtype: \(cst)\n"
    } else if cpuType.is_x86, let cts = i386CpuSubtype(rawValue: cpuSubtype) {
      desc += "cpuSubtype: \(cts)\n"
    }
    desc += "fileType: \(fileType)\n"
    desc += "ncmds: \(ncmds)\n"
    desc += "sizeofcmds: \(ByteCountFormatter.string(fromByteCount: Int64(sizeofcmds), countStyle: .decimal))\n"
    desc += "flags: \(flags)\n"
    desc += "reserved: \(reserved)\n"
    return desc
  }
}
