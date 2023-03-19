import Foundation

@frozen
public enum LoadCommandType: UInt32 {
  /// segment of this file to be mapped
  case segment = 0x1

  /// link-edit stab symbol table info
  case symtab = 0x2

  /// link-edit gdb symbol table info (obsolete)
  case symseg = 0x3

  /// thread
  case thread = 0x4

  /// unix thread (includes a stack)
  case unixThread = 0x5

  /// load a specified fixed VM shared library
  case loadFVMLib = 0x6

  /// fixed VM shared library identification
  case idFVMLib = 0x7

  /// object identification info (obsolete)
  case ident = 0x8

  /// fixed VM file inclusion (internal use)
  case fvmFile = 0x9

  /// prepage command (internal use)
  case prePage = 0xa

  /// dynamic link-edit symbol table info
  case dysymtab = 0xb

  /// load a dynamically linked shared library
  case loadDylib = 0xc

  /// dynamically linked shared lib ident
  case idDylib = 0xd

  /// load a dynamic linker
  case loadDylinker = 0xe

  /// dynamic linker identification
  case idDylinker = 0xf

  /// modules prebound for a dynamically linked shared library
  case preboundDylib = 0x10

  /// image routines
  case routines = 0x11

  /// sub framework
  case subFramework = 0x12

  /// sub umbrella
  case subUmbrella = 0x13

  /// sub client
  case subClient = 0x14

  /// sub library
  case subLibrary = 0x15

  /// two-level namespace lookup hints
  case twoLevelHints = 0x16

  /// prebind checksum
  case prebindChecksum = 0x17
}

extension LoadCommandType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .segment:
      return "segment"
    case .symtab:
      return "symtab"
    case .symseg:
      return "symseg"
    case .thread:
      return "thread"
    case .unixThread:
      return "unixThread"
    case .loadFVMLib:
      return "loadFVMLib"
    case .idFVMLib:
      return "idFVMLib"
    case .ident:
      return "ident"
    case .fvmFile:
      return "fvmFile"
    case .prePage:
      return "prePage"
    case .dysymtab:
      return "dysymtab"
    case .loadDylib:
      return "loadDylib"
    case .idDylib:
      return "idDylib"
    case .loadDylinker:
      return "loadDylinker"
    case .idDylinker:
      return "idDylinker"
    case .preboundDylib:
      return "preboundDylib"
    case .routines:
      return "routines"
    case .subFramework:
      return "subFramework"
    case .subUmbrella:
      return "subUmbrella"
    case .subClient:
      return "subClient"
    case .subLibrary:
      return "subLibrary"
    case .twoLevelHints:
      return "twoLevelHints"
    case .prebindChecksum:
      return "prebindChecksum"
    }
  }
}
