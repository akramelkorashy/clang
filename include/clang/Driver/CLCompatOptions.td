//===--- CLCompatOptions.td - Options for clang-cl ------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//  This file defines the options accepted by clang-cl.
//
//===----------------------------------------------------------------------===//

def cl_Group : OptionGroup<"<clang-cl options>">,
  HelpText<"CL.EXE COMPATIBILITY OPTIONS">;

def cl_compile_Group : OptionGroup<"<clang-cl compile-only options>">,
  Group<cl_Group>;

def cl_ignored_Group : OptionGroup<"<clang-cl ignored options>">,
  Group<cl_Group>;

class CLFlag<string name> : Option<["/", "-"], name, KIND_FLAG>,
  Group<cl_Group>, Flags<[CLOption, DriverOption]>;

class CLCompileFlag<string name> : Option<["/", "-"], name, KIND_FLAG>,
  Group<cl_compile_Group>, Flags<[CLOption, DriverOption]>;

class CLIgnoredFlag<string name> : Option<["/", "-"], name, KIND_FLAG>,
  Group<cl_ignored_Group>, Flags<[CLOption, DriverOption, HelpHidden]>;

class CLJoined<string name> : Option<["/", "-"], name, KIND_JOINED>,
  Group<cl_Group>, Flags<[CLOption, DriverOption]>;

class CLCompileJoined<string name> : Option<["/", "-"], name, KIND_JOINED>,
  Group<cl_compile_Group>, Flags<[CLOption, DriverOption]>;

class CLIgnoredJoined<string name> : Option<["/", "-"], name, KIND_JOINED>,
  Group<cl_ignored_Group>, Flags<[CLOption, DriverOption, HelpHidden]>;

class CLJoinedOrSeparate<string name> : Option<["/", "-"], name,
  KIND_JOINED_OR_SEPARATE>, Group<cl_Group>, Flags<[CLOption, DriverOption]>;

class CLCompileJoinedOrSeparate<string name> : Option<["/", "-"], name,
  KIND_JOINED_OR_SEPARATE>, Group<cl_compile_Group>,
  Flags<[CLOption, DriverOption]>;

class CLRemainingArgs<string name> : Option<["/", "-"], name,
  KIND_REMAINING_ARGS>, Group<cl_Group>, Flags<[CLOption, DriverOption]>;

// Aliases:
// (We don't put any of these in cl_compile_Group as the options they alias are
// already in the right group.)

def _SLASH_C : CLFlag<"C">,
  HelpText<"Don't discard comments when preprocessing">, Alias<C>;
def _SLASH_c : CLFlag<"c">, HelpText<"Compile only">, Alias<c>;
def _SLASH_D : CLJoinedOrSeparate<"D">, HelpText<"Define macro">,
  MetaVarName<"<macro[=value]>">, Alias<D>;
def _SLASH_E : CLFlag<"E">, HelpText<"Preprocess to stdout">, Alias<E>;
def _SLASH_fp_except : CLFlag<"fp:except">, HelpText<"">, Alias<ftrapping_math>;
def _SLASH_fp_except_ : CLFlag<"fp:except-">,
  HelpText<"">, Alias<fno_trapping_math>;
def _SLASH_fp_fast : CLFlag<"fp:fast">, HelpText<"">, Alias<ffast_math>;
def _SLASH_fp_precise : CLFlag<"fp:precise">,
  HelpText<"">, Alias<fno_fast_math>;
def _SLASH_fp_strict : CLFlag<"fp:strict">, HelpText<"">, Alias<fno_fast_math>;
def _SLASH_GA : CLFlag<"GA">, Alias<ftlsmodel_EQ>, AliasArgs<["local-exec"]>,
  HelpText<"Assume thread-local variables are defined in the executable">;
def _SLASH_GR : CLFlag<"GR">, HelpText<"Enable emission of RTTI data">;
def _SLASH_GR_ : CLFlag<"GR-">, HelpText<"Disable emission of RTTI data">;
def _SLASH_GF_ : CLFlag<"GF-">, HelpText<"Disable string pooling">,
  Alias<fwritable_strings>;
def _SLASH_Gs : CLJoined<"Gs">, HelpText<"Set stack probe size">,
  Alias<mstack_probe_size>;
def _SLASH_Gy : CLFlag<"Gy">, HelpText<"Put each function in its own section">,
  Alias<ffunction_sections>;
def _SLASH_Gy_ : CLFlag<"Gy-">,
  HelpText<"Don't put each function in its own section">,
  Alias<fno_function_sections>;
def _SLASH_Gw : CLFlag<"Gw">, HelpText<"Put each data item in its own section">,
  Alias<fdata_sections>;
def _SLASH_Gw_ : CLFlag<"Gw-">,
  HelpText<"Don't put each data item in its own section">,
  Alias<fno_data_sections>;
def _SLASH_help : CLFlag<"help">, Alias<help>,
  HelpText<"Display available options">;
def _SLASH_HELP : CLFlag<"HELP">, Alias<help>;
def _SLASH_I : CLJoinedOrSeparate<"I">,
  HelpText<"Add directory to include search path">, MetaVarName<"<dir>">,
  Alias<I>;
def _SLASH_J : CLFlag<"J">, HelpText<"Make char type unsigned">,
  Alias<funsigned_char>;
def _SLASH_O0 : CLFlag<"O0">, Alias<O0>;
def _SLASH_O : CLJoined<"O">, HelpText<"Optimization level">;
def _SLASH_Ob0 : CLFlag<"Ob0">, HelpText<"Disable inlining">,
  Alias<fno_inline>;
def _SLASH_Od : CLFlag<"Od">, HelpText<"Disable optimization">, Alias<O0>;
def _SLASH_Oi : CLFlag<"Oi">, HelpText<"Enable use of builtin functions">,
  Alias<fbuiltin>;
def _SLASH_Oi_ : CLFlag<"Oi-">, HelpText<"Disable use of builtin functions">,
  Alias<fno_builtin>;
def _SLASH_Os : CLFlag<"Os">, HelpText<"Optimize for size">, Alias<O>,
  AliasArgs<["s"]>;
def _SLASH_Ot : CLFlag<"Ot">, HelpText<"Optimize for speed">, Alias<O>,
  AliasArgs<["2"]>;
def _SLASH_QUESTION : CLFlag<"?">, Alias<help>,
  HelpText<"Display available options">;
def _SLASH_Qvec : CLFlag<"Qvec">,
  HelpText<"Enable the loop vectorization passes">, Alias<fvectorize>;
def _SLASH_Qvec_ : CLFlag<"Qvec-">,
  HelpText<"Disable the loop vectorization passes">, Alias<fno_vectorize>;
def _SLASH_showIncludes : CLFlag<"showIncludes">,
  HelpText<"Print info about included files to stderr">,
  Alias<show_includes>;
def _SLASH_U : CLJoinedOrSeparate<"U">, HelpText<"Undefine macro">,
  MetaVarName<"<macro>">, Alias<U>;
def _SLASH_W0 : CLFlag<"W0">, HelpText<"Disable all warnings">, Alias<w>;
def _SLASH_W1 : CLFlag<"W1">, HelpText<"Enable -Wall">, Alias<Wall>;
def _SLASH_W2 : CLFlag<"W2">, HelpText<"Enable -Wall">, Alias<Wall>;
def _SLASH_W3 : CLFlag<"W3">, HelpText<"Enable -Wall">, Alias<Wall>;
def _SLASH_W4 : CLFlag<"W4">, HelpText<"Enable -Wall">, Alias<Wall>;
def _SLASH_Wall : CLFlag<"Wall">, HelpText<"Enable -Wall">, Alias<Wall>;
def _SLASH_WX : CLFlag<"WX">, HelpText<"Treat warnings as errors">,
  Alias<W_Joined>, AliasArgs<["error"]>;
def _SLASH_WX_ : CLFlag<"WX-">, HelpText<"Do not treat warnings as errors">,
  Alias<W_Joined>, AliasArgs<["no-error"]>;
def _SLASH_w_flag : CLFlag<"w">, HelpText<"Disable all warnings">, Alias<w>;
def _SLASH_wd4005 : CLFlag<"wd4005">, Alias<W_Joined>,
  AliasArgs<["no-macro-redefined"]>;
def _SLASH_wd4996 : CLFlag<"wd4996">, Alias<W_Joined>,
  AliasArgs<["no-deprecated-declarations"]>;
def _SLASH_wd4910 : CLFlag<"wd4910">, Alias<W_Joined>,
  AliasArgs<["no-dllexport-explicit-instantiation-decl"]>;
def _SLASH_vd : CLJoined<"vd">, HelpText<"Control vtordisp placement">,
  Alias<vtordisp_mode_EQ>;
def _SLASH_Zc_sizedDealloc : CLFlag<"Zc:sizedDealloc">,
  HelpText<"Enable C++14 sized global deallocation functions">,
  Alias<fsized_deallocation>;
def _SLASH_Zc_sizedDealloc_ : CLFlag<"Zc:sizedDealloc-">,
  HelpText<"Disable C++14 sized global deallocation functions">,
  Alias<fno_sized_deallocation>;
def _SLASH_Zc_strictStrings : CLFlag<"Zc:strictStrings">,
  HelpText<"Treat string literals as const">, Alias<W_Joined>,
  AliasArgs<["error=c++11-compat-deprecated-writable-strings"]>;
def _SLASH_Zc_threadSafeInit : CLFlag<"Zc:threadSafeInit">,
  HelpText<"Enable thread-safe initialization of static variables">,
  Alias<fthreadsafe_statics>;
def _SLASH_Zc_threadSafeInit_ : CLFlag<"Zc:threadSafeInit-">,
  HelpText<"Disable thread-safe initialization of static variables">,
  Alias<fno_threadsafe_statics>;
def _SLASH_Zc_trigraphs : CLFlag<"Zc:trigraphs">,
  HelpText<"Enable trigraphs">, Alias<ftrigraphs>;
def _SLASH_Zc_trigraphs_off : CLFlag<"Zc:trigraphs-">,
  HelpText<"Disable trigraphs (default)">, Alias<fno_trigraphs>;
def _SLASH_Z7 : CLFlag<"Z7">,
  HelpText<"Enable CodeView debug information in object files">;
def _SLASH_Zi : CLFlag<"Zi">, Alias<_SLASH_Z7>,
  HelpText<"Alias for /Z7. Does not produce PDBs.">;
def _SLASH_Zp : CLJoined<"Zp">,
  HelpText<"Specify the default maximum struct packing alignment">,
  Alias<fpack_struct_EQ>;
def _SLASH_Zp_flag : CLFlag<"Zp">,
  HelpText<"Set the default maximum struct packing alignment to 1">,
  Alias<fpack_struct_EQ>, AliasArgs<["1"]>;
def _SLASH_Zs : CLFlag<"Zs">, HelpText<"Syntax-check only">,
  Alias<fsyntax_only>;


// Non-aliases:

def _SLASH_arch : CLCompileJoined<"arch:">,
  HelpText<"Set architecture for code generation">;

def _SLASH_M_Group : OptionGroup<"</M group>">, Group<cl_compile_Group>;
def _SLASH_volatile_Group : OptionGroup<"</volatile group>">,
  Group<cl_compile_Group>;

def _SLASH_EH : CLJoined<"EH">, HelpText<"Exception handling model">;
def _SLASH_EP : CLFlag<"EP">,
  HelpText<"Disable linemarker output and preprocess to stdout">;
def _SLASH_FA : CLFlag<"FA">,
  HelpText<"Output assembly code file during compilation">;
def _SLASH_Fa : CLJoined<"Fa">,
  HelpText<"Output assembly code to this file during compilation (with /FA)">,
  MetaVarName<"<file or directory>">;
def _SLASH_fallback : CLCompileFlag<"fallback">,
  HelpText<"Fall back to cl.exe if clang-cl fails to compile">;
def _SLASH_FI : CLJoinedOrSeparate<"FI">,
  HelpText<"Include file before parsing">, Alias<include_>;
def _SLASH_Fe : CLJoined<"Fe">,
  HelpText<"Set output executable file or directory (ends in / or \\)">,
  MetaVarName<"<file or directory>">;
def _SLASH_Fi : CLCompileJoined<"Fi">,
  HelpText<"Set preprocess output file name (with /P)">,
  MetaVarName<"<file>">;
def _SLASH_Fo : CLCompileJoined<"Fo">,
  HelpText<"Set output object file, or directory (ends in / or \\) (with /c)">,
  MetaVarName<"<file or directory>">;
def _SLASH_LD : CLFlag<"LD">, HelpText<"Create DLL">;
def _SLASH_LDd : CLFlag<"LDd">, HelpText<"Create debug DLL">;
def _SLASH_link : CLRemainingArgs<"link">,
  HelpText<"Forward options to the linker">, MetaVarName<"<options>">;
def _SLASH_MD : Option<["/", "-"], "MD", KIND_FLAG>, Group<_SLASH_M_Group>,
  Flags<[CLOption, DriverOption]>, HelpText<"Use DLL run-time">;
def _SLASH_MDd : Option<["/", "-"], "MDd", KIND_FLAG>, Group<_SLASH_M_Group>,
  Flags<[CLOption, DriverOption]>, HelpText<"Use DLL debug run-time">;
def _SLASH_MT : Option<["/", "-"], "MT", KIND_FLAG>, Group<_SLASH_M_Group>,
  Flags<[CLOption, DriverOption]>, HelpText<"Use static run-time">;
def _SLASH_MTd : Option<["/", "-"], "MTd", KIND_FLAG>, Group<_SLASH_M_Group>,
  Flags<[CLOption, DriverOption]>, HelpText<"Use static debug run-time">;
def _SLASH_o : CLJoinedOrSeparate<"o">,
  HelpText<"Set output file or directory (ends in / or \\)">,
  MetaVarName<"<file or directory>">;
def _SLASH_P : CLFlag<"P">, HelpText<"Preprocess to file">;
def _SLASH_Tc : CLCompileJoinedOrSeparate<"Tc">,
  HelpText<"Specify a C source file">, MetaVarName<"<filename>">;
def _SLASH_TC : CLCompileFlag<"TC">, HelpText<"Treat all source files as C">;
def _SLASH_Tp : CLCompileJoinedOrSeparate<"Tp">,
  HelpText<"Specify a C++ source file">, MetaVarName<"<filename>">;
def _SLASH_TP : CLCompileFlag<"TP">, HelpText<"Treat all source files as C++">;
def _SLASH_volatile_iso : Option<["/", "-"], "volatile:iso", KIND_FLAG>,
  Group<_SLASH_volatile_Group>, Flags<[CLOption, DriverOption]>,
  HelpText<"Volatile loads and stores have standard semantics">;
def _SLASH_vmb : CLFlag<"vmb">,
  HelpText<"Use a best-case representation method for member pointers">;
def _SLASH_vmg : CLFlag<"vmg">,
  HelpText<"Use a most-general representation for member pointers">;
def _SLASH_vms : CLFlag<"vms">,
  HelpText<"Set the default most-general representation to single inheritance">;
def _SLASH_vmm : CLFlag<"vmm">,
  HelpText<"Set the default most-general representation to "
           "multiple inheritance">;
def _SLASH_vmv : CLFlag<"vmv">,
  HelpText<"Set the default most-general representation to "
           "virtual inheritance">;
def _SLASH_volatile_ms  : Option<["/", "-"], "volatile:ms", KIND_FLAG>,
  Group<_SLASH_volatile_Group>, Flags<[CLOption, DriverOption]>,
  HelpText<"Volatile loads and stores have acquire and release semantics">;
def _SLASH_Zl : CLFlag<"Zl">,
  HelpText<"Don't mention any default libraries in the object file">;

// Ignored:

def _SLASH_analyze_ : CLIgnoredFlag<"analyze-">;
def _SLASH_bigobj : CLIgnoredFlag<"bigobj">;
def _SLASH_cgthreads : CLIgnoredJoined<"cgthreads">;
def _SLASH_d2Zi_PLUS : CLIgnoredFlag<"d2Zi+">;
def _SLASH_errorReport : CLIgnoredJoined<"errorReport">;
def _SLASH_Fd : CLIgnoredJoined<"Fd">;
def _SLASH_FS : CLIgnoredFlag<"FS">, HelpText<"Force synchronous PDB writes">;
def _SLASH_Gd : CLIgnoredFlag<"Gd">;
def _SLASH_GF : CLIgnoredFlag<"GF">;
def _SLASH_GS_ : CLIgnoredFlag<"GS-">;
def _SLASH_kernel_ : CLIgnoredFlag<"kernel-">;
def _SLASH_nologo : CLIgnoredFlag<"nologo">;
def _SLASH_Ob1 : CLIgnoredFlag<"Ob1">;
def _SLASH_Ob2 : CLIgnoredFlag<"Ob2">;
def _SLASH_Og : CLIgnoredFlag<"Og">;
def _SLASH_openmp_ : CLIgnoredFlag<"openmp-">;
def _SLASH_RTC : CLIgnoredJoined<"RTC">;
def _SLASH_sdl : CLIgnoredFlag<"sdl">;
def _SLASH_sdl_ : CLIgnoredFlag<"sdl-">;
def _SLASH_w : CLIgnoredJoined<"w">;
def _SLASH_Zc_auto : CLIgnoredFlag<"Zc:auto">;
def _SLASH_Zc_forScope : CLIgnoredFlag<"Zc:forScope">;
def _SLASH_Zc_inline : CLIgnoredFlag<"Zc:inline">;
def _SLASH_Zc_rvalueCast : CLIgnoredFlag<"Zc:rvalueCast">;
def _SLASH_Zc_wchar_t : CLIgnoredFlag<"Zc:wchar_t">;
def _SLASH_Zm : CLIgnoredJoined<"Zm">;
def _SLASH_Zo : CLIgnoredFlag<"Zo">;
def _SLASH_Zo_ : CLIgnoredFlag<"Zo-">;


// Unsupported:

def _SLASH_AI : CLJoined<"AI">;
def _SLASH_clr : CLJoined<"clr">;
def _SLASH_doc : CLJoined<"doc">;
def _SLASH_FA_joined : CLJoined<"FA">;
def _SLASH_favor : CLJoined<"favor">;
def _SLASH_FC : CLFlag<"FC">;
def _SLASH_F : CLFlag<"F">;
def _SLASH_Fm : CLJoined<"Fm">;
def _SLASH_Fp : CLJoined<"Fp">;
def _SLASH_Fr : CLJoined<"Fr">;
def _SLASH_FR : CLJoined<"FR">;
def _SLASH_FU : CLJoinedOrSeparate<"FU">;
def _SLASH_Fx : CLFlag<"Fx">;
def _SLASH_G1 : CLFlag<"G1">;
def _SLASH_G2 : CLFlag<"G2">;
def _SLASH_Ge : CLFlag<"Ge">;
def _SLASH_Gh : CLFlag<"Gh">;
def _SLASH_GH : CLFlag<"GH">;
def _SLASH_GL : CLFlag<"GL">;
def _SLASH_GL_ : CLFlag<"GL-">;
def _SLASH_Gm : CLFlag<"Gm">;
def _SLASH_Gm_ : CLFlag<"Gm-">;
def _SLASH_Gr : CLFlag<"Gr">;
def _SLASH_GS : CLFlag<"GS">;
def _SLASH_GT : CLFlag<"GT">;
def _SLASH_GX : CLFlag<"GX">;
def _SLASH_Gv : CLFlag<"Gv">;
def _SLASH_Gz : CLFlag<"Gz">;
def _SLASH_GZ : CLFlag<"GZ">;
def _SLASH_H : CLFlag<"H">;
def _SLASH_homeparams : CLFlag<"homeparams">;
def _SLASH_hotpatch : CLFlag<"hotpatch">;
def _SLASH_kernel : CLFlag<"kernel">;
def _SLASH_LN : CLFlag<"LN">;
def _SLASH_MP : CLJoined<"MP">;
def _SLASH_openmp : CLFlag<"openmp">;
def _SLASH_Qfast_transcendentals : CLFlag<"Qfast_transcendentals">;
def _SLASH_QIfist : CLFlag<"QIfist">;
def _SLASH_Qimprecise_fwaits : CLFlag<"Qimprecise_fwaits">;
def _SLASH_Qpar : CLFlag<"Qpar">;
def _SLASH_Qvec_report : CLJoined<"Qvec-report">;
def _SLASH_u : CLFlag<"u">;
def _SLASH_V : CLFlag<"V">;
def _SLASH_WL : CLFlag<"WL">;
def _SLASH_Wp64 : CLFlag<"Wp64">;
def _SLASH_X : CLFlag<"X">;
def _SLASH_Yc : CLJoined<"Yc">;
def _SLASH_Y_ : CLFlag<"Y-">;
def _SLASH_Yd : CLFlag<"Yd">;
def _SLASH_Yl : CLJoined<"Yl">;
def _SLASH_Yu : CLJoined<"Yu">;
def _SLASH_Za : CLFlag<"Za">;
def _SLASH_Zc : CLJoined<"Zc:">;
def _SLASH_Ze : CLFlag<"Ze">;
def _SLASH_Zg : CLFlag<"Zg">;
def _SLASH_ZI : CLFlag<"ZI">;
def _SLASH_ZW : CLJoined<"ZW">;
