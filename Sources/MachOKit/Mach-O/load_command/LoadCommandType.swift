import Foundation

@frozen
public enum LoadCommandType: UInt32 {
  static let LC_REQ_DYLD: UInt32 = 0x80000000

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
  case prepage = 0xa
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
  /// load a dynamically linked shared library that is allowed to be missing (all symbols are weak imported).
  case loadWeakDylib = 0x80000018
  /// 64-bit segment of this file to be mapped
  case segment64 = 0x19
  /// 64-bit image routines
  case routines64 = 0x1a
  /// the uuid
  case uuid = 0x1b
  /// runpath additions
  case rpath = 0x8000001c
  /// local of code signature
  case codeSignature = 0x1d
  /// local of info to split segments
  case segmentSplitInfo = 0x1e
  /// load and re-export dylib
  case reexportDylib = 0x8000001f
  /// delay load of dylib until first use
  case lazyLoadDylib = 0x20
  /// encrypted segment information
  case encryptionInfo = 0x21
  /// compressed dyld information
  case dyldInfo = 0x22
  /// compressed dyld information only
  case dyldInfoOnly = 0x80000022
  /// load upward dylib
  case loadUpwardDylib = 0x80000023
  /// build for MacOSX min OS version
  case versionMinMacOSX = 0x24
  /// build for iPhoneOS min OS version
  case versionMiniPhoneOS = 0x25
  /// compressed table of function start addresses
  case functionStarts = 0x26
  /// string for dyld to treat like environment variable
  case dyldEnvironment = 0x27
  /// replacement for LC_UNIXTHREAD
  case main = 0x80000028
  /// table of non-instructions in __text
  case dataInCode = 0x29
  /// source version used to build binary
  case sourceVersion = 0x2A
  /// Code signing DRs copied from linked dylibs
  case dylibCodeSignDRs = 0x2B
  /// 64-bit encrypted segment information
  case encryptionInfo64 = 0x2C
  /// linker options in MH_OBJECT files
  case linkerOption = 0x2D
  /// optimization hints in MH_OBJECT files
  case linkerOptimizationHint = 0x2E
}

extension LoadCommandType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .segment:
      return "segment of this file to be mapped"
    case .symtab:
      return "link-edit stab symbol table info"
    case .symseg:
      return "link-edit gdb symbol table info (obsolete)"
    case .thread:
      return "thread"
    case .unixThread:
      return "unix thread (includes a stack)"
    case .loadFVMLib:
      return "load a specified fixed VM shared library"
    case .idFVMLib:
      return "fixed VM shared library identification"
    case .ident:
      return "object identification info (obsolete)"
    case .fvmFile:
      return "fixed VM file inclusion (internal use)"
    case .prepage:
      return "prepage command (internal use)"
    case .dysymtab:
      return "dynamic link-edit symbol table info"
    case .loadDylib:
      return "load a dynamically linked shared library"
    case .idDylib:
      return "dynamically linked shared lib ident"
    case .loadDylinker:
      return "load a dynamic linker"
    case .idDylinker:
      return "dynamic linker identification"
    case .preboundDylib:
      return "modules prebound for a dynamically linked shared library"
    case .routines:
      return "image routines"
    case .subFramework:
      return "sub framework"
    case .subUmbrella:
      return "sub umbrella"
    case .subClient:
      return "sub client"
    case .subLibrary:
      return "sub library"
    case .twoLevelHints:
      return "two-level namespace lookup hints"
    case .prebindChecksum:
      return "prebind checksum"
    case .loadWeakDylib:
      return "load a dynamically linked shared library that is allowed to be missing"
    case .segment64:
      return "64-bit segment of this file to be mapped"
    case .routines64:
      return "64-bit image routines"
    case .uuid:
      return "the uuid"
    case .rpath:
      return "runpath additions"
    case .codeSignature:
      return "local of code signature"
    case .segmentSplitInfo:
      return "local of info to split segments"
    case .reexportDylib:
      return "load and re-export dylib"
    case .lazyLoadDylib:
      return "delay load of dylib until first use"
    case .encryptionInfo:
      return "encrypted segment information"
    case .dyldInfo:
      return "compressed dyld information"
    case .dyldInfoOnly:
      return "compressed dyld information only"
    case .loadUpwardDylib:
      return "load upward dylib"
    case .versionMinMacOSX:
      return "build for MacOSX min OS version"
    case .versionMiniPhoneOS:
      return "build for iPhoneOS min OS version"
    case .functionStarts:
      return "compressed table of function start addresses"
    case .dyldEnvironment:
      return "string for dyld to treat like environment variable"
    case .main:
      return "replacement for LC_UNIXTHREAD"
    case .dataInCode:
      return "table of non-instructions in __text"
    case .sourceVersion:
      return "source version used to build binary"
    case .dylibCodeSignDRs:
      return "Code signing DRs copied from linked dylibs"
    case .encryptionInfo64:
      return "64-bit encrypted segment information"
    case .linkerOption:
      return "linker options in MH_OBJECT files"
    case .linkerOptimizationHint:
      return "optimization hints in MH_OBJECT files"
    }
  }
}
