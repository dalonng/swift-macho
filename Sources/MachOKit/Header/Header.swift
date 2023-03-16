//
//  Header.swift
//  MachOKit
//
//  Created by d on 2023/3/14.
//

import Foundation

/// https://en.wikipedia.org/wiki/Mach-O#Multi-architecture_binaries
struct Header {
  /// 4 bytes
  let magicNumber: MagicNumber

  /// 4 bytes cpu type
  let cpuType: CpuType

  /// 4 bytes cpu subtype (ArmCpuSubype | i386CpuSubype)
  let cpuSubtype: UInt32

  /// 4 bytes file type
  let fileType: FileType

  /// 4 bytes Number of load commands
  let loadCommandsCount: UInt32

  /// 4 bytes Size of load commands
  let loadCommandsSize: UInt32

  /// 4 bytes Flags
  let flags: Flags

  /// 4 bytes Reserved (64-bit only)
  let reserved: UInt32

  init(magicNumber: MagicNumber, cpuType: CpuType, cpuSubtype: UInt32, fileType: FileType, loadCommandsCount: UInt32, loadCommandsSize: UInt32, flags: Flags, reserved: UInt32) {
    self.magicNumber = magicNumber
    self.cpuType = cpuType
    self.cpuSubtype = cpuSubtype
    self.fileType = fileType
    self.loadCommandsCount = loadCommandsCount
    self.loadCommandsSize = loadCommandsSize
    self.flags = flags
    self.reserved = reserved
  }
}

extension Header: CustomStringConvertible {
  public var description: String {
    var desc = ""
    desc += "magicNumber: \(magicNumber)\n"
    desc += "cpuType: \(cpuType)\n"
    if cpuType.isArm, let cst = ArmCpuSubtype(rawValue: cpuSubtype) {
      desc += "cpuSubtype: \(cst)\n"
    } else if cpuType.is_x86, let cts = i386CpuSubtype(rawValue: cpuSubtype)  {
      desc += "cpuSubtype: \(cts)\n"
    }
    desc += "fileType: \(fileType)\n"
    desc += "loadCommandsCount: \(loadCommandsCount)\n"
    desc += "loadCommandsSize: \(loadCommandsSize)\n"
    desc += "flags: \(flags)\n"
    desc += "reserved: \(reserved)\n"
    return desc
  }
}
