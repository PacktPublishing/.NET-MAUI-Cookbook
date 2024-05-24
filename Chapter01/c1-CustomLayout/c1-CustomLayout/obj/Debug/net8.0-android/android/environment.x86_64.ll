; ModuleID = 'environment.x86_64.ll'
source_filename = "environment.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.ApplicationConfig = type {
	i8, ; bool uses_mono_llvm
	i8, ; bool uses_mono_aot
	i8, ; bool aot_lazy_load
	i8, ; bool uses_assembly_preload
	i8, ; bool broken_exception_transitions
	i8, ; bool instant_run_enabled
	i8, ; bool jni_add_native_method_registration_attribute_present
	i8, ; bool have_runtime_config_blob
	i8, ; bool have_assemblies_blob
	i8, ; bool marshal_methods_enabled
	i8, ; uint8_t bound_stream_io_exception_type
	i32, ; uint32_t package_naming_policy
	i32, ; uint32_t environment_variable_count
	i32, ; uint32_t system_property_count
	i32, ; uint32_t number_of_assemblies_in_apk
	i32, ; uint32_t bundled_assembly_name_width
	i32, ; uint32_t number_of_assembly_store_files
	i32, ; uint32_t number_of_dso_cache_entries
	i32, ; uint32_t android_runtime_jnienv_class_token
	i32, ; uint32_t jnienv_initialize_method_token
	i32, ; uint32_t jnienv_registerjninatives_method_token
	i32, ; uint32_t jni_remapping_replacement_type_count
	i32, ; uint32_t jni_remapping_replacement_method_index_entry_count
	i32, ; uint32_t mono_components_mask
	ptr ; char* android_package_name
}

%struct.AssemblyStoreAssemblyDescriptor = type {
	i32, ; uint32_t data_offset
	i32, ; uint32_t data_size
	i32, ; uint32_t debug_data_offset
	i32, ; uint32_t debug_data_size
	i32, ; uint32_t config_data_offset
	i32 ; uint32_t config_data_size
}

%struct.AssemblyStoreRuntimeData = type {
	ptr, ; uint8_t data_start
	i32, ; uint32_t assembly_count
	ptr ; AssemblyStoreAssemblyDescriptor assemblies
}

%struct.AssemblyStoreSingleAssemblyRuntimeData = type {
	ptr, ; uint8_t image_data
	ptr, ; uint8_t debug_info_data
	ptr, ; uint8_t config_data
	ptr ; AssemblyStoreAssemblyDescriptor descriptor
}

%struct.DSOCacheEntry = type {
	i64, ; uint64_t hash
	i8, ; bool ignore
	ptr, ; char* name
	ptr ; void* handle
}

%struct.XamarinAndroidBundledAssembly = type {
	i32, ; int32_t apk_fd
	i32, ; uint32_t data_offset
	i32, ; uint32_t data_size
	ptr, ; uint8_t data
	i32, ; uint32_t name_length
	ptr ; char* name
}

; 0x15e6972616d58
@format_tag = dso_local local_unnamed_addr constant i64 385281960275288, align 8

@mono_aot_mode_name = dso_local local_unnamed_addr constant ptr @.str.0, align 8

; Application environment variables array, name:value
@app_environment_variables = dso_local local_unnamed_addr constant [12 x ptr] [
	ptr @.env.0, ; 0
	ptr @.env.1, ; 1
	ptr @.env.2, ; 2
	ptr @.env.3, ; 3
	ptr @.env.4, ; 4
	ptr @.env.5, ; 5
	ptr @.env.6, ; 6
	ptr @.env.7, ; 7
	ptr @.env.8, ; 8
	ptr @.env.9, ; 9
	ptr @.env.10, ; 10
	ptr @.env.11 ; 11
], align 16

; System properties defined by the application
@app_system_properties = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@application_config = dso_local local_unnamed_addr constant %struct.ApplicationConfig {
	i8 0, ; bool uses_mono_llvm
	i8 1, ; bool uses_mono_aot
	i8 0, ; bool aot_lazy_load
	i8 0, ; bool uses_assembly_preload
	i8 0, ; bool broken_exception_transitions
	i8 0, ; bool instant_run_enabled
	i8 0, ; bool jni_add_native_method_registration_attribute_present
	i8 1, ; bool have_runtime_config_blob
	i8 0, ; bool have_assemblies_blob
	i8 0, ; bool marshal_methods_enabled
	i8 0, ; uint8_t bound_stream_io_exception_type (0x0)
	i32 3, ; uint32_t package_naming_policy (0x3)
	i32 12, ; uint32_t environment_variable_count (0xc)
	i32 0, ; uint32_t system_property_count (0x0)
	i32 307, ; uint32_t number_of_assemblies_in_apk (0x133)
	i32 65, ; uint32_t bundled_assembly_name_width (0x41)
	i32 2, ; uint32_t number_of_assembly_store_files (0x2)
	i32 36, ; uint32_t number_of_dso_cache_entries (0x24)
	i32 33560135, ; uint32_t android_runtime_jnienv_class_token (0x2001647)
	i32 100757451, ; uint32_t jnienv_initialize_method_token (0x6016fcb)
	i32 100757450, ; uint32_t jnienv_registerjninatives_method_token (0x6016fca)
	i32 0, ; uint32_t jni_remapping_replacement_type_count (0x0)
	i32 0, ; uint32_t jni_remapping_replacement_method_index_entry_count (0x0)
	i32 3, ; uint32_t mono_components_mask (0x3)
	ptr @.ApplicationConfig.0_android_package_name; char* android_package_name
}, align 16

; DSO cache entries
@dso_cache = dso_local local_unnamed_addr global [36 x %struct.DSOCacheEntry] [
	%struct.DSOCacheEntry {
		i64 716574749169539573, ; hash 0x9f1c8f01343d9f5, from name: mono-component-debugger
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libmono-component-debugger.so
		ptr null; void* handle (0x0)
	}, ; 0
	%struct.DSOCacheEntry {
		i64 1499327756876432029, ; hash 0x14ceaea6ae80c29d, from name: libSystem.Security.Cryptography.Native.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 1
	%struct.DSOCacheEntry {
		i64 2676598929141056664, ; hash 0x2525308b79a4c498, from name: xamarin-debug-app-helper.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libxamarin-debug-app-helper.so
		ptr null; void* handle (0x0)
	}, ; 2
	%struct.DSOCacheEntry {
		i64 3569692625789698928, ; hash 0x318a1887b586c370, from name: libmono-component-hot_reload
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-hot_reload.so
		ptr null; void* handle (0x0)
	}, ; 3
	%struct.DSOCacheEntry {
		i64 5642869431399447073, ; hash 0x4e4f7fd9c4797a21, from name: libmono-component-hot_reload.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-hot_reload.so
		ptr null; void* handle (0x0)
	}, ; 4
	%struct.DSOCacheEntry {
		i64 5900900230463535802, ; hash 0x51e4357ecbccbaba, from name: System.Security.Cryptography.Native.Android.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 5
	%struct.DSOCacheEntry {
		i64 5948985717485083712, ; hash 0x528f0afdb0921c40, from name: libSystem.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 6
	%struct.DSOCacheEntry {
		i64 6073268355799849528, ; hash 0x544895645d121a38, from name: libmono-component-debugger
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libmono-component-debugger.so
		ptr null; void* handle (0x0)
	}, ; 7
	%struct.DSOCacheEntry {
		i64 6308061292769401015, ; hash 0x578abc5300e958b7, from name: libSystem.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 8
	%struct.DSOCacheEntry {
		i64 6558713382764477133, ; hash 0x5b053b127346facd, from name: mono-component-marshal-ilgen.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 9
	%struct.DSOCacheEntry {
		i64 6635387966917840004, ; hash 0x5c15a2333b0a0c84, from name: libxamarin-debug-app-helper.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libxamarin-debug-app-helper.so
		ptr null; void* handle (0x0)
	}, ; 10
	%struct.DSOCacheEntry {
		i64 6913716284728566067, ; hash 0x5ff274549d146133, from name: System.IO.Compression.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 11
	%struct.DSOCacheEntry {
		i64 7338982286544642983, ; hash 0x65d94d818a60a3a7, from name: monodroid.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 12
	%struct.DSOCacheEntry {
		i64 7415347135721941512, ; hash 0x66e89aee86eaaa08, from name: libmono-component-marshal-ilgen
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 13
	%struct.DSOCacheEntry {
		i64 7639941140308737920, ; hash 0x6a0685fd2cfebf80, from name: libSystem.IO.Compression.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 14
	%struct.DSOCacheEntry {
		i64 7740286304433625072, ; hash 0x6b6b0562539657f0, from name: libmonosgen-2.0
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 15
	%struct.DSOCacheEntry {
		i64 7852346557833039773, ; hash 0x6cf9239740e64f9d, from name: libxamarin-debug-app-helper
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libxamarin-debug-app-helper.so
		ptr null; void* handle (0x0)
	}, ; 16
	%struct.DSOCacheEntry {
		i64 8129154283138605531, ; hash 0x70d08ec01ad261db, from name: mono-component-marshal-ilgen
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 17
	%struct.DSOCacheEntry {
		i64 8392333777418328833, ; hash 0x74778f1b27881b01, from name: libmonodroid.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 18
	%struct.DSOCacheEntry {
		i64 8626645781824515032, ; hash 0x77b800a1f4c5abd8, from name: System.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 19
	%struct.DSOCacheEntry {
		i64 9055317871244365271, ; hash 0x7daaf3a073c44dd7, from name: monodroid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 20
	%struct.DSOCacheEntry {
		i64 10403090626863083606, ; hash 0x905f33cea45eb056, from name: mono-component-debugger.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libmono-component-debugger.so
		ptr null; void* handle (0x0)
	}, ; 21
	%struct.DSOCacheEntry {
		i64 10484826484908863027, ; hash 0x918196231499ae33, from name: xamarin-debug-app-helper
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.8_name, ; name: libxamarin-debug-app-helper.so
		ptr null; void* handle (0x0)
	}, ; 22
	%struct.DSOCacheEntry {
		i64 11164818937994912957, ; hash 0x9af167ab9cbda4bd, from name: System.Security.Cryptography.Native.Android
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	}, ; 23
	%struct.DSOCacheEntry {
		i64 11521729796983092563, ; hash 0x9fe56834a335f553, from name: libmonodroid
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.7_name, ; name: libmonodroid.so
		ptr null; void* handle (0x0)
	}, ; 24
	%struct.DSOCacheEntry {
		i64 14424844866220670826, ; hash 0xc82f57facf333f6a, from name: monosgen-2.0.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 25
	%struct.DSOCacheEntry {
		i64 14939551082710594120, ; hash 0xcf53f28e7cc47248, from name: mono-component-hot_reload
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-hot_reload.so
		ptr null; void* handle (0x0)
	}, ; 26
	%struct.DSOCacheEntry {
		i64 16217712076265891113, ; hash 0xe110e3354f642529, from name: libmono-component-marshal-ilgen.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.5_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle (0x0)
	}, ; 27
	%struct.DSOCacheEntry {
		i64 16273606707797624453, ; hash 0xe1d7771458b10685, from name: System.Native.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.Native.so
		ptr null; void* handle (0x0)
	}, ; 28
	%struct.DSOCacheEntry {
		i64 16717189724135467099, ; hash 0xe7ff637b8de7a85b, from name: libmonosgen-2.0.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 29
	%struct.DSOCacheEntry {
		i64 16804602679676381986, ; hash 0xe935f11a41b02b22, from name: monosgen-2.0
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.6_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle (0x0)
	}, ; 30
	%struct.DSOCacheEntry {
		i64 17577202782581072989, ; hash 0xf3eec4cd80c0a45d, from name: System.IO.Compression.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 31
	%struct.DSOCacheEntry {
		i64 18001227312549183156, ; hash 0xf9d134ddbd8dbeb4, from name: mono-component-hot_reload.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-hot_reload.so
		ptr null; void* handle (0x0)
	}, ; 32
	%struct.DSOCacheEntry {
		i64 18037761627775429063, ; hash 0xfa5300a1deb9e9c7, from name: libmono-component-debugger.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.3_name, ; name: libmono-component-debugger.so
		ptr null; void* handle (0x0)
	}, ; 33
	%struct.DSOCacheEntry {
		i64 18145848498878603418, ; hash 0xfbd30111a3b6e09a, from name: libSystem.IO.Compression.Native
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle (0x0)
	}, ; 34
	%struct.DSOCacheEntry {
		i64 18257096356770733190, ; hash 0xfd5e3c67ff65dc86, from name: libSystem.Security.Cryptography.Native.Android.so
		i8 0, ; bool ignore
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle (0x0)
	} ; 35
], align 16

@_XamarinAndroidBundledAssembly_name_0_0 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1_1 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2_2 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3_3 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4_4 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5_5 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6_6 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7_7 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8_8 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9_9 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a_a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b_b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c_c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d_d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e_e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f_f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_10_10 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_11_11 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_12_12 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_13_13 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_14_14 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_15_15 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_16_16 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_17_17 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_18_18 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_19_19 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1a_1a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1b_1b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1c_1c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1d_1d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1e_1e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_1f_1f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_20_20 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_21_21 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_22_22 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_23_23 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_24_24 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_25_25 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_26_26 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_27_27 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_28_28 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_29_29 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2a_2a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2b_2b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2c_2c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2d_2d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2e_2e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_2f_2f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_30_30 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_31_31 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_32_32 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_33_33 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_34_34 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_35_35 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_36_36 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_37_37 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_38_38 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_39_39 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3a_3a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3b_3b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3c_3c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3d_3d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3e_3e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_3f_3f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_40_40 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_41_41 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_42_42 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_43_43 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_44_44 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_45_45 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_46_46 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_47_47 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_48_48 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_49_49 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4a_4a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4b_4b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4c_4c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4d_4d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4e_4e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_4f_4f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_50_50 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_51_51 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_52_52 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_53_53 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_54_54 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_55_55 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_56_56 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_57_57 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_58_58 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_59_59 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5a_5a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5b_5b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5c_5c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5d_5d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5e_5e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_5f_5f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_60_60 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_61_61 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_62_62 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_63_63 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_64_64 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_65_65 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_66_66 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_67_67 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_68_68 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_69_69 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6a_6a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6b_6b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6c_6c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6d_6d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6e_6e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_6f_6f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_70_70 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_71_71 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_72_72 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_73_73 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_74_74 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_75_75 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_76_76 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_77_77 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_78_78 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_79_79 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7a_7a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7b_7b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7c_7c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7d_7d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7e_7e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_7f_7f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_80_80 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_81_81 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_82_82 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_83_83 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_84_84 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_85_85 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_86_86 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_87_87 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_88_88 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_89_89 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8a_8a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8b_8b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8c_8c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8d_8d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8e_8e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_8f_8f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_90_90 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_91_91 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_92_92 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_93_93 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_94_94 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_95_95 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_96_96 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_97_97 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_98_98 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_99_99 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9a_9a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9b_9b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9c_9c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9d_9d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9e_9e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_9f_9f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a0_a0 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a1_a1 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a2_a2 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a3_a3 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a4_a4 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a5_a5 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a6_a6 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a7_a7 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a8_a8 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_a9_a9 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_aa_aa = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ab_ab = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ac_ac = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ad_ad = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ae_ae = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_af_af = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b0_b0 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b1_b1 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b2_b2 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b3_b3 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b4_b4 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b5_b5 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b6_b6 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b7_b7 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b8_b8 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_b9_b9 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ba_ba = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_bb_bb = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_bc_bc = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_bd_bd = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_be_be = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_bf_bf = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c0_c0 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c1_c1 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c2_c2 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c3_c3 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c4_c4 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c5_c5 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c6_c6 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c7_c7 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c8_c8 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_c9_c9 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ca_ca = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_cb_cb = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_cc_cc = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_cd_cd = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ce_ce = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_cf_cf = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d0_d0 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d1_d1 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d2_d2 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d3_d3 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d4_d4 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d5_d5 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d6_d6 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d7_d7 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d8_d8 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_d9_d9 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_da_da = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_db_db = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_dc_dc = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_dd_dd = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_de_de = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_df_df = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e0_e0 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e1_e1 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e2_e2 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e3_e3 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e4_e4 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e5_e5 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e6_e6 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e7_e7 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e8_e8 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_e9_e9 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ea_ea = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_eb_eb = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ec_ec = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ed_ed = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ee_ee = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ef_ef = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f0_f0 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f1_f1 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f2_f2 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f3_f3 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f4_f4 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f5_f5 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f6_f6 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f7_f7 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f8_f8 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_f9_f9 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_fa_fa = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_fb_fb = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_fc_fc = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_fd_fd = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_fe_fe = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_ff_ff = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_100_100 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_101_101 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_102_102 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_103_103 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_104_104 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_105_105 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_106_106 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_107_107 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_108_108 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_109_109 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_10a_10a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_10b_10b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_10c_10c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_10d_10d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_10e_10e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_10f_10f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_110_110 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_111_111 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_112_112 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_113_113 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_114_114 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_115_115 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_116_116 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_117_117 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_118_118 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_119_119 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_11a_11a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_11b_11b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_11c_11c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_11d_11d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_11e_11e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_11f_11f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_120_120 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_121_121 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_122_122 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_123_123 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_124_124 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_125_125 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_126_126 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_127_127 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_128_128 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_129_129 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_12a_12a = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_12b_12b = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_12c_12c = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_12d_12d = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_12e_12e = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_12f_12f = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_130_130 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_131_131 = internal dso_local global [65 x i8] zeroinitializer, align 16
@_XamarinAndroidBundledAssembly_name_132_132 = internal dso_local global [65 x i8] zeroinitializer, align 16

; Bundled assembly name buffers, all 65 bytes long
@bundled_assemblies = dso_local local_unnamed_addr global [307 x %struct.XamarinAndroidBundledAssembly] [
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_0_0; char* name
	}, ; 0
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_1_1; char* name
	}, ; 1
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_2_2; char* name
	}, ; 2
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_3_3; char* name
	}, ; 3
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_4_4; char* name
	}, ; 4
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_5_5; char* name
	}, ; 5
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_6_6; char* name
	}, ; 6
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_7_7; char* name
	}, ; 7
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_8_8; char* name
	}, ; 8
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_9_9; char* name
	}, ; 9
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_a_a; char* name
	}, ; 10
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_b_b; char* name
	}, ; 11
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_c_c; char* name
	}, ; 12
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_d_d; char* name
	}, ; 13
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_e_e; char* name
	}, ; 14
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_f_f; char* name
	}, ; 15
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_10_10; char* name
	}, ; 16
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_11_11; char* name
	}, ; 17
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_12_12; char* name
	}, ; 18
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_13_13; char* name
	}, ; 19
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_14_14; char* name
	}, ; 20
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_15_15; char* name
	}, ; 21
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_16_16; char* name
	}, ; 22
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_17_17; char* name
	}, ; 23
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_18_18; char* name
	}, ; 24
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_19_19; char* name
	}, ; 25
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_1a_1a; char* name
	}, ; 26
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_1b_1b; char* name
	}, ; 27
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_1c_1c; char* name
	}, ; 28
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_1d_1d; char* name
	}, ; 29
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_1e_1e; char* name
	}, ; 30
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_1f_1f; char* name
	}, ; 31
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_20_20; char* name
	}, ; 32
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_21_21; char* name
	}, ; 33
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_22_22; char* name
	}, ; 34
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_23_23; char* name
	}, ; 35
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_24_24; char* name
	}, ; 36
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_25_25; char* name
	}, ; 37
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_26_26; char* name
	}, ; 38
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_27_27; char* name
	}, ; 39
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_28_28; char* name
	}, ; 40
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_29_29; char* name
	}, ; 41
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_2a_2a; char* name
	}, ; 42
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_2b_2b; char* name
	}, ; 43
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_2c_2c; char* name
	}, ; 44
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_2d_2d; char* name
	}, ; 45
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_2e_2e; char* name
	}, ; 46
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_2f_2f; char* name
	}, ; 47
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_30_30; char* name
	}, ; 48
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_31_31; char* name
	}, ; 49
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_32_32; char* name
	}, ; 50
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_33_33; char* name
	}, ; 51
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_34_34; char* name
	}, ; 52
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_35_35; char* name
	}, ; 53
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_36_36; char* name
	}, ; 54
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_37_37; char* name
	}, ; 55
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_38_38; char* name
	}, ; 56
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_39_39; char* name
	}, ; 57
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_3a_3a; char* name
	}, ; 58
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_3b_3b; char* name
	}, ; 59
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_3c_3c; char* name
	}, ; 60
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_3d_3d; char* name
	}, ; 61
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_3e_3e; char* name
	}, ; 62
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_3f_3f; char* name
	}, ; 63
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_40_40; char* name
	}, ; 64
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_41_41; char* name
	}, ; 65
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_42_42; char* name
	}, ; 66
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_43_43; char* name
	}, ; 67
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_44_44; char* name
	}, ; 68
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_45_45; char* name
	}, ; 69
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_46_46; char* name
	}, ; 70
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_47_47; char* name
	}, ; 71
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_48_48; char* name
	}, ; 72
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_49_49; char* name
	}, ; 73
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_4a_4a; char* name
	}, ; 74
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_4b_4b; char* name
	}, ; 75
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_4c_4c; char* name
	}, ; 76
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_4d_4d; char* name
	}, ; 77
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_4e_4e; char* name
	}, ; 78
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_4f_4f; char* name
	}, ; 79
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_50_50; char* name
	}, ; 80
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_51_51; char* name
	}, ; 81
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_52_52; char* name
	}, ; 82
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_53_53; char* name
	}, ; 83
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_54_54; char* name
	}, ; 84
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_55_55; char* name
	}, ; 85
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_56_56; char* name
	}, ; 86
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_57_57; char* name
	}, ; 87
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_58_58; char* name
	}, ; 88
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_59_59; char* name
	}, ; 89
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_5a_5a; char* name
	}, ; 90
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_5b_5b; char* name
	}, ; 91
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_5c_5c; char* name
	}, ; 92
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_5d_5d; char* name
	}, ; 93
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_5e_5e; char* name
	}, ; 94
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_5f_5f; char* name
	}, ; 95
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_60_60; char* name
	}, ; 96
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_61_61; char* name
	}, ; 97
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_62_62; char* name
	}, ; 98
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_63_63; char* name
	}, ; 99
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_64_64; char* name
	}, ; 100
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_65_65; char* name
	}, ; 101
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_66_66; char* name
	}, ; 102
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_67_67; char* name
	}, ; 103
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_68_68; char* name
	}, ; 104
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_69_69; char* name
	}, ; 105
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_6a_6a; char* name
	}, ; 106
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_6b_6b; char* name
	}, ; 107
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_6c_6c; char* name
	}, ; 108
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_6d_6d; char* name
	}, ; 109
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_6e_6e; char* name
	}, ; 110
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_6f_6f; char* name
	}, ; 111
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_70_70; char* name
	}, ; 112
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_71_71; char* name
	}, ; 113
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_72_72; char* name
	}, ; 114
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_73_73; char* name
	}, ; 115
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_74_74; char* name
	}, ; 116
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_75_75; char* name
	}, ; 117
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_76_76; char* name
	}, ; 118
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_77_77; char* name
	}, ; 119
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_78_78; char* name
	}, ; 120
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_79_79; char* name
	}, ; 121
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_7a_7a; char* name
	}, ; 122
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_7b_7b; char* name
	}, ; 123
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_7c_7c; char* name
	}, ; 124
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_7d_7d; char* name
	}, ; 125
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_7e_7e; char* name
	}, ; 126
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_7f_7f; char* name
	}, ; 127
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_80_80; char* name
	}, ; 128
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_81_81; char* name
	}, ; 129
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_82_82; char* name
	}, ; 130
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_83_83; char* name
	}, ; 131
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_84_84; char* name
	}, ; 132
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_85_85; char* name
	}, ; 133
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_86_86; char* name
	}, ; 134
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_87_87; char* name
	}, ; 135
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_88_88; char* name
	}, ; 136
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_89_89; char* name
	}, ; 137
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_8a_8a; char* name
	}, ; 138
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_8b_8b; char* name
	}, ; 139
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_8c_8c; char* name
	}, ; 140
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_8d_8d; char* name
	}, ; 141
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_8e_8e; char* name
	}, ; 142
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_8f_8f; char* name
	}, ; 143
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_90_90; char* name
	}, ; 144
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_91_91; char* name
	}, ; 145
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_92_92; char* name
	}, ; 146
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_93_93; char* name
	}, ; 147
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_94_94; char* name
	}, ; 148
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_95_95; char* name
	}, ; 149
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_96_96; char* name
	}, ; 150
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_97_97; char* name
	}, ; 151
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_98_98; char* name
	}, ; 152
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_99_99; char* name
	}, ; 153
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_9a_9a; char* name
	}, ; 154
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_9b_9b; char* name
	}, ; 155
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_9c_9c; char* name
	}, ; 156
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_9d_9d; char* name
	}, ; 157
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_9e_9e; char* name
	}, ; 158
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_9f_9f; char* name
	}, ; 159
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_a0_a0; char* name
	}, ; 160
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_a1_a1; char* name
	}, ; 161
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_a2_a2; char* name
	}, ; 162
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_a3_a3; char* name
	}, ; 163
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_a4_a4; char* name
	}, ; 164
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_a5_a5; char* name
	}, ; 165
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_a6_a6; char* name
	}, ; 166
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_a7_a7; char* name
	}, ; 167
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_a8_a8; char* name
	}, ; 168
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_a9_a9; char* name
	}, ; 169
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_aa_aa; char* name
	}, ; 170
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ab_ab; char* name
	}, ; 171
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ac_ac; char* name
	}, ; 172
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ad_ad; char* name
	}, ; 173
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ae_ae; char* name
	}, ; 174
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_af_af; char* name
	}, ; 175
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_b0_b0; char* name
	}, ; 176
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_b1_b1; char* name
	}, ; 177
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_b2_b2; char* name
	}, ; 178
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_b3_b3; char* name
	}, ; 179
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_b4_b4; char* name
	}, ; 180
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_b5_b5; char* name
	}, ; 181
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_b6_b6; char* name
	}, ; 182
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_b7_b7; char* name
	}, ; 183
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_b8_b8; char* name
	}, ; 184
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_b9_b9; char* name
	}, ; 185
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ba_ba; char* name
	}, ; 186
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_bb_bb; char* name
	}, ; 187
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_bc_bc; char* name
	}, ; 188
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_bd_bd; char* name
	}, ; 189
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_be_be; char* name
	}, ; 190
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_bf_bf; char* name
	}, ; 191
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_c0_c0; char* name
	}, ; 192
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_c1_c1; char* name
	}, ; 193
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_c2_c2; char* name
	}, ; 194
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_c3_c3; char* name
	}, ; 195
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_c4_c4; char* name
	}, ; 196
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_c5_c5; char* name
	}, ; 197
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_c6_c6; char* name
	}, ; 198
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_c7_c7; char* name
	}, ; 199
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_c8_c8; char* name
	}, ; 200
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_c9_c9; char* name
	}, ; 201
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ca_ca; char* name
	}, ; 202
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_cb_cb; char* name
	}, ; 203
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_cc_cc; char* name
	}, ; 204
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_cd_cd; char* name
	}, ; 205
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ce_ce; char* name
	}, ; 206
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_cf_cf; char* name
	}, ; 207
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_d0_d0; char* name
	}, ; 208
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_d1_d1; char* name
	}, ; 209
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_d2_d2; char* name
	}, ; 210
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_d3_d3; char* name
	}, ; 211
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_d4_d4; char* name
	}, ; 212
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_d5_d5; char* name
	}, ; 213
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_d6_d6; char* name
	}, ; 214
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_d7_d7; char* name
	}, ; 215
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_d8_d8; char* name
	}, ; 216
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_d9_d9; char* name
	}, ; 217
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_da_da; char* name
	}, ; 218
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_db_db; char* name
	}, ; 219
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_dc_dc; char* name
	}, ; 220
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_dd_dd; char* name
	}, ; 221
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_de_de; char* name
	}, ; 222
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_df_df; char* name
	}, ; 223
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_e0_e0; char* name
	}, ; 224
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_e1_e1; char* name
	}, ; 225
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_e2_e2; char* name
	}, ; 226
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_e3_e3; char* name
	}, ; 227
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_e4_e4; char* name
	}, ; 228
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_e5_e5; char* name
	}, ; 229
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_e6_e6; char* name
	}, ; 230
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_e7_e7; char* name
	}, ; 231
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_e8_e8; char* name
	}, ; 232
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_e9_e9; char* name
	}, ; 233
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ea_ea; char* name
	}, ; 234
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_eb_eb; char* name
	}, ; 235
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ec_ec; char* name
	}, ; 236
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ed_ed; char* name
	}, ; 237
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ee_ee; char* name
	}, ; 238
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ef_ef; char* name
	}, ; 239
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_f0_f0; char* name
	}, ; 240
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_f1_f1; char* name
	}, ; 241
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_f2_f2; char* name
	}, ; 242
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_f3_f3; char* name
	}, ; 243
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_f4_f4; char* name
	}, ; 244
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_f5_f5; char* name
	}, ; 245
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_f6_f6; char* name
	}, ; 246
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_f7_f7; char* name
	}, ; 247
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_f8_f8; char* name
	}, ; 248
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_f9_f9; char* name
	}, ; 249
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_fa_fa; char* name
	}, ; 250
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_fb_fb; char* name
	}, ; 251
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_fc_fc; char* name
	}, ; 252
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_fd_fd; char* name
	}, ; 253
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_fe_fe; char* name
	}, ; 254
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_ff_ff; char* name
	}, ; 255
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_100_100; char* name
	}, ; 256
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_101_101; char* name
	}, ; 257
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_102_102; char* name
	}, ; 258
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_103_103; char* name
	}, ; 259
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_104_104; char* name
	}, ; 260
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_105_105; char* name
	}, ; 261
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_106_106; char* name
	}, ; 262
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_107_107; char* name
	}, ; 263
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_108_108; char* name
	}, ; 264
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_109_109; char* name
	}, ; 265
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_10a_10a; char* name
	}, ; 266
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_10b_10b; char* name
	}, ; 267
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_10c_10c; char* name
	}, ; 268
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_10d_10d; char* name
	}, ; 269
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_10e_10e; char* name
	}, ; 270
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_10f_10f; char* name
	}, ; 271
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_110_110; char* name
	}, ; 272
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_111_111; char* name
	}, ; 273
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_112_112; char* name
	}, ; 274
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_113_113; char* name
	}, ; 275
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_114_114; char* name
	}, ; 276
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_115_115; char* name
	}, ; 277
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_116_116; char* name
	}, ; 278
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_117_117; char* name
	}, ; 279
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_118_118; char* name
	}, ; 280
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_119_119; char* name
	}, ; 281
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_11a_11a; char* name
	}, ; 282
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_11b_11b; char* name
	}, ; 283
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_11c_11c; char* name
	}, ; 284
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_11d_11d; char* name
	}, ; 285
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_11e_11e; char* name
	}, ; 286
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_11f_11f; char* name
	}, ; 287
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_120_120; char* name
	}, ; 288
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_121_121; char* name
	}, ; 289
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_122_122; char* name
	}, ; 290
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_123_123; char* name
	}, ; 291
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_124_124; char* name
	}, ; 292
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_125_125; char* name
	}, ; 293
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_126_126; char* name
	}, ; 294
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_127_127; char* name
	}, ; 295
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_128_128; char* name
	}, ; 296
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_129_129; char* name
	}, ; 297
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_12a_12a; char* name
	}, ; 298
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_12b_12b; char* name
	}, ; 299
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_12c_12c; char* name
	}, ; 300
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_12d_12d; char* name
	}, ; 301
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_12e_12e; char* name
	}, ; 302
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_12f_12f; char* name
	}, ; 303
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_130_130; char* name
	}, ; 304
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_131_131; char* name
	}, ; 305
	%struct.XamarinAndroidBundledAssembly {
		i32 -1, ; int32_t apk_fd (0xffffffff)
		i32 0, ; uint32_t data_offset (0x0)
		i32 0, ; uint32_t data_size (0x0)
		ptr null, ; uint8_t* data (0x0)
		i32 65, ; uint32_t name_length (0x41)
		ptr @_XamarinAndroidBundledAssembly_name_132_132; char* name
	} ; 306
], align 16

@assembly_store_bundled_assemblies = dso_local local_unnamed_addr global [0 x %struct.AssemblyStoreSingleAssemblyRuntimeData] zeroinitializer, align 8

@assembly_stores = dso_local local_unnamed_addr global [0 x %struct.AssemblyStoreRuntimeData] zeroinitializer, align 8

; Strings
@.str.0 = private unnamed_addr constant [7 x i8] c"interp\00", align 1

; Application environment variables name:value pairs
@.env.0 = private unnamed_addr constant [29 x i8] c"DOTNET_MODIFIABLE_ASSEMBLIES\00", align 16
@.env.1 = private unnamed_addr constant [6 x i8] c"Debug\00", align 1
@.env.2 = private unnamed_addr constant [15 x i8] c"MONO_GC_PARAMS\00", align 1
@.env.3 = private unnamed_addr constant [21 x i8] c"major=marksweep-conc\00", align 16
@.env.4 = private unnamed_addr constant [15 x i8] c"MONO_LOG_LEVEL\00", align 1
@.env.5 = private unnamed_addr constant [5 x i8] c"info\00", align 1
@.env.6 = private unnamed_addr constant [17 x i8] c"XAMARIN_BUILD_ID\00", align 16
@.env.7 = private unnamed_addr constant [37 x i8] c"65b468ac-206d-4f42-bc76-a70944eab5d6\00", align 16
@.env.8 = private unnamed_addr constant [28 x i8] c"XA_HTTP_CLIENT_HANDLER_TYPE\00", align 16
@.env.9 = private unnamed_addr constant [42 x i8] c"Xamarin.Android.Net.AndroidMessageHandler\00", align 16
@.env.10 = private unnamed_addr constant [29 x i8] c"__XA_PACKAGE_NAMING_POLICY__\00", align 16
@.env.11 = private unnamed_addr constant [15 x i8] c"LowercaseCrc64\00", align 1

;ApplicationConfig
@.ApplicationConfig.0_android_package_name = private unnamed_addr constant [31 x i8] c"com.companyname.c1customlayout\00", align 16

;DSOCacheEntry
@.DSOCacheEntry.0_name = private unnamed_addr constant [35 x i8] c"libSystem.IO.Compression.Native.so\00", align 16
@.DSOCacheEntry.1_name = private unnamed_addr constant [20 x i8] c"libSystem.Native.so\00", align 16
@.DSOCacheEntry.2_name = private unnamed_addr constant [50 x i8] c"libSystem.Security.Cryptography.Native.Android.so\00", align 16
@.DSOCacheEntry.3_name = private unnamed_addr constant [30 x i8] c"libmono-component-debugger.so\00", align 16
@.DSOCacheEntry.4_name = private unnamed_addr constant [32 x i8] c"libmono-component-hot_reload.so\00", align 16
@.DSOCacheEntry.5_name = private unnamed_addr constant [35 x i8] c"libmono-component-marshal-ilgen.so\00", align 16
@.DSOCacheEntry.6_name = private unnamed_addr constant [19 x i8] c"libmonosgen-2.0.so\00", align 16
@.DSOCacheEntry.7_name = private unnamed_addr constant [16 x i8] c"libmonodroid.so\00", align 16
@.DSOCacheEntry.8_name = private unnamed_addr constant [31 x i8] c"libxamarin-debug-app-helper.so\00", align 16

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
