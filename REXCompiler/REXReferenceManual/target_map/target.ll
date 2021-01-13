
; __CLANG_OFFLOAD_BUNDLE____START__ openmp-nvptx64
; ModuleID = 'target.c'
source_filename = "target.c"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%class.omptarget_nvptx_Queue = type { [16 x %class.omptarget_nvptx_ThreadPrivateContext], [16 x %class.omptarget_nvptx_ThreadPrivateContext*], i32, [16 x i32], i32, [8 x i8] }
%class.omptarget_nvptx_ThreadPrivateContext = type { %class.omptarget_nvptx_TeamDescr, [1024 x %class.omptarget_nvptx_TaskDescr], [1024 x %class.omptarget_nvptx_TaskDescr*], %union.anon, [1024 x i32], [1024 x i64], [1024 x i64], [1024 x i64], [1024 x i64], i64, [8 x i8] }
%class.omptarget_nvptx_TeamDescr = type { %class.omptarget_nvptx_TaskDescr, %class.omptarget_nvptx_WorkDescr, i64, [8 x i8], [32 x %struct.__kmpc_data_sharing_worker_slot_static], [1 x %struct.__kmpc_data_sharing_master_slot_static] }
%class.omptarget_nvptx_TaskDescr = type { %"struct.omptarget_nvptx_TaskDescr::SavedLoopDescr_items", %"struct.omptarget_nvptx_TaskDescr::TaskDescr_items", %class.omptarget_nvptx_TaskDescr* }
%"struct.omptarget_nvptx_TaskDescr::SavedLoopDescr_items" = type { i64, i64, i64, i64, i32 }
%"struct.omptarget_nvptx_TaskDescr::TaskDescr_items" = type { i8, i8, i16, i64 }
%class.omptarget_nvptx_WorkDescr = type { %class.omptarget_nvptx_TaskDescr }
%struct.__kmpc_data_sharing_worker_slot_static = type { %struct.__kmpc_data_sharing_slot*, %struct.__kmpc_data_sharing_slot*, i8*, i8*, [8192 x i8] }
%struct.__kmpc_data_sharing_slot = type { %struct.__kmpc_data_sharing_slot*, %struct.__kmpc_data_sharing_slot*, i8*, i8*, [0 x i8] }
%struct.__kmpc_data_sharing_master_slot_static = type { %struct.__kmpc_data_sharing_slot*, %struct.__kmpc_data_sharing_slot*, i8*, i8*, [256 x i8] }
%union.anon = type { [1024 x i16] }
%struct.DataSharingStateTy = type { [32 x %struct.__kmpc_data_sharing_slot*], [32 x i8*], [32 x i8*], [32 x i32] }
%printf_args.5 = type { i32, i32, i32 }
%printf_args.6 = type { i32, i32, i32 }

@"_openmp_kernel_static_glob_rd$ptr" = internal addrspace(3) global i8* null
@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 3, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@.str1 = private unnamed_addr constant [19 x i8] c"Test1 %d, %d, %d.\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"Test2 %d, %d, %d.\0A\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 3, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@__omp_offloading_fd00_61254ba_main_l14_exec_mode = weak constant i8 0
@llvm.compiler.used = appending global [1 x i8*] [i8* @__omp_offloading_fd00_61254ba_main_l14_exec_mode], section "llvm.metadata"
@parallelLevel = external dso_local local_unnamed_addr addrspace(3) global [32 x i8], align 1
@threadsInTeam = external dso_local local_unnamed_addr addrspace(3) global i16, align 2
@execution_param = external dso_local local_unnamed_addr addrspace(3) global i32, align 4
@usedSlotIdx = external dso_local local_unnamed_addr addrspace(3) global i32, align 4
@omptarget_nvptx_device_State = external dso_local addrspace(1) global [16 x %class.omptarget_nvptx_Queue], align 16
@omptarget_nvptx_threadPrivateContext = external dso_local local_unnamed_addr addrspace(3) global %class.omptarget_nvptx_ThreadPrivateContext*, align 8
@DataSharingState = external dso_local addrspace(3) global %struct.DataSharingStateTy, align 8

; Function Attrs: noinline norecurse nounwind optnone
define weak void @__omp_offloading_fd00_61254ba_main_l14(i32* dereferenceable(4) %b, i32* dereferenceable(4) %c, i32* dereferenceable(4) %d) #0 {
entry:
  %b.addr = alloca i32*, align 8
  %c.addr = alloca i32*, align 8
  %d.addr = alloca i32*, align 8
  %.zero.addr = alloca i32, align 4
  %.threadid_temp. = alloca i32, align 4
  %.bound.zero.addr = alloca i32, align 4
  store i32 0, i32* %.bound.zero.addr, align 4
  store i32 0, i32* %.zero.addr, align 4
  store i32* %b, i32** %b.addr, align 8
  store i32* %c, i32** %c.addr, align 8
  store i32* %d, i32** %d.addr, align 8
  %0 = load i32*, i32** %b.addr, align 8
  %1 = load i32*, i32** %c.addr, align 8
  %2 = load i32*, i32** %d.addr, align 8
  %nvptx_num_threads = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !range !12
  call void @__kmpc_spmd_kernel_init(i32 %nvptx_num_threads, i16 0, i16 0)
  br label %.execute

.execute:                                         ; preds = %entry
  %3 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @1)
  store i32 %3, i32* %.threadid_temp., align 4
  call void @__omp_outlined__(i32* %.threadid_temp., i32* %.bound.zero.addr, i32* %0, i32* %1, i32* %2) #13
  br label %.omp.deinit

.omp.deinit:                                      ; preds = %.execute
  call void @__kmpc_spmd_kernel_deinit_v2(i16 0)
  br label %.exit

.exit:                                            ; preds = %.omp.deinit
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #1

; Function Attrs: noinline norecurse nounwind optnone
define internal void @__omp_outlined__(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %b, i32* dereferenceable(4) %c, i32* dereferenceable(4) %d) #0 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  %c.addr = alloca i32*, align 8
  %d.addr = alloca i32*, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %i = alloca i32, align 4
  %tmp3 = alloca %printf_args.5
  %tmp4 = alloca %printf_args.6
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  store i32* %b, i32** %b.addr, align 8
  store i32* %c, i32** %c.addr, align 8
  store i32* %d, i32** %d.addr, align 8
  %0 = load i32*, i32** %b.addr, align 8
  %1 = load i32*, i32** %c.addr, align 8
  %2 = load i32*, i32** %d.addr, align 8
  store i32 0, i32* %.omp.lb, align 4
  store i32 2, i32* %.omp.ub, align 4
  store i32 1, i32* %.omp.stride, align 4
  store i32 0, i32* %.omp.is_last, align 4
  %3 = load i32*, i32** %.global_tid..addr, align 8
  %4 = load i32, i32* %3, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @0, i32 %4, i32 33, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1)
  br label %omp.dispatch.cond

omp.dispatch.cond:                                ; preds = %omp.dispatch.inc, %entry
  %5 = load i32, i32* %.omp.ub, align 4
  %cmp = icmp sgt i32 %5, 2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %omp.dispatch.cond
  br label %cond.end

cond.false:                                       ; preds = %omp.dispatch.cond
  %6 = load i32, i32* %.omp.ub, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 2, %cond.true ], [ %6, %cond.false ]
  store i32 %cond, i32* %.omp.ub, align 4
  %7 = load i32, i32* %.omp.lb, align 4
  store i32 %7, i32* %.omp.iv, align 4
  %8 = load i32, i32* %.omp.iv, align 4
  %9 = load i32, i32* %.omp.ub, align 4
  %cmp1 = icmp sle i32 %8, %9
  br i1 %cmp1, label %omp.dispatch.body, label %omp.dispatch.end

omp.dispatch.body:                                ; preds = %cond.end
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %omp.dispatch.body
  %10 = load i32, i32* %.omp.iv, align 4
  %11 = load i32, i32* %.omp.ub, align 4
  %cmp2 = icmp sle i32 %10, %11
  br i1 %cmp2, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %12 = load i32, i32* %.omp.iv, align 4
  %mul = mul nsw i32 %12, 1
  %add = add nsw i32 0, %mul
  store i32 %add, i32* %i, align 4
  %13 = load i32, i32* %0, align 4
  %14 = load i32, i32* %1, align 4
  %15 = load i32, i32* %2, align 4
  %16 = getelementptr inbounds %printf_args.5, %printf_args.5* %tmp3, i32 0, i32 0
  store i32 %13, i32* %16, align 4
  %17 = getelementptr inbounds %printf_args.5, %printf_args.5* %tmp3, i32 0, i32 1
  store i32 %14, i32* %17, align 4
  %18 = getelementptr inbounds %printf_args.5, %printf_args.5* %tmp3, i32 0, i32 2
  store i32 %15, i32* %18, align 4
  %19 = bitcast %printf_args.5* %tmp3 to i8*
  %20 = call i32 @vprintf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str1, i64 0, i64 0), i8* %19)
  store i32 40, i32* %0, align 4
  store i32 60, i32* %1, align 4
  store i32 80, i32* %2, align 4
  %21 = load i32, i32* %0, align 4
  %22 = load i32, i32* %1, align 4
  %23 = load i32, i32* %2, align 4
  %24 = getelementptr inbounds %printf_args.6, %printf_args.6* %tmp4, i32 0, i32 0
  store i32 %21, i32* %24, align 4
  %25 = getelementptr inbounds %printf_args.6, %printf_args.6* %tmp4, i32 0, i32 1
  store i32 %22, i32* %25, align 4
  %26 = getelementptr inbounds %printf_args.6, %printf_args.6* %tmp4, i32 0, i32 2
  store i32 %23, i32* %26, align 4
  %27 = bitcast %printf_args.6* %tmp4 to i8*
  %28 = call i32 @vprintf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str2, i64 0, i64 0), i8* %27)
  br label %omp.body.continue

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %29 = load i32, i32* %.omp.iv, align 4
  %add5 = add nsw i32 %29, 1
  store i32 %add5, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.dispatch.inc

omp.dispatch.inc:                                 ; preds = %omp.inner.for.end
  %30 = load i32, i32* %.omp.lb, align 4
  %31 = load i32, i32* %.omp.stride, align 4
  %add6 = add nsw i32 %30, %31
  store i32 %add6, i32* %.omp.lb, align 4
  %32 = load i32, i32* %.omp.ub, align 4
  %33 = load i32, i32* %.omp.stride, align 4
  %add7 = add nsw i32 %32, %33
  store i32 %add7, i32* %.omp.ub, align 4
  br label %omp.dispatch.cond

omp.dispatch.end:                                 ; preds = %cond.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @0, i32 %4)
  ret void
}

declare i32 @vprintf(i8*, i8*)

; Function Attrs: convergent nounwind
define internal void @__kmpc_for_static_init_4(%struct.ident_t* %loc, i32 %global_tid, i32 %schedtype, i32* nocapture %plastiter, i32* nocapture %plower, i32* nocapture %pupper, i32* nocapture %pstride, i32 %incr, i32 %chunk) #2 {
entry:
  %call = call zeroext i1 @_Z13checkSPMDModeP5ident(%struct.ident_t* %loc) #14
  %call.i = call i32 @_Z21GetNumberOfOmpThreadsb(i1 zeroext %call) #14
  %0 = load i32, i32* %plower, align 4, !tbaa !13
  %1 = load i32, i32* %pupper, align 4, !tbaa !13
  %and.i = and i32 %schedtype, -1610612737
  switch i32 %and.i, label %sw.default.i [
    i32 33, label %sw.bb.i
    i32 45, label %sw.bb1.i
    i32 34, label %sw.bb14.i
    i32 91, label %sw.bb15.i
    i32 92, label %sw.bb21.i
    i32 93, label %sw.bb24.i
  ]

sw.bb.i:                                          ; preds = %entry
  %cmp.i = icmp sgt i32 %chunk, 0
  br i1 %cmp.i, label %if.then.i, label %sw.bb1.i

if.then.i:                                        ; preds = %sw.bb.i
  %mul.i.i = mul nsw i32 %call.i, %chunk
  %mul1.i.i = mul nsw i32 %chunk, %global_tid
  %add.i.i = add nsw i32 %0, %mul1.i.i
  %add2.i.i = add i32 %chunk, -1
  %sub.i.i = add i32 %add2.i.i, %add.i.i
  %rem.i.i = srem i32 %1, %chunk
  %sub3.i.i = sub i32 %1, %add.i.i
  %sub4.i.i = sub i32 %sub3.i.i, %rem.i.i
  %rem5.i.i = srem i32 %sub4.i.i, %mul.i.i
  %cmp.i.i = icmp eq i32 %rem5.i.i, 0
  br label %_ZN27omptarget_nvptx_LoopSupportIiiE15for_static_initEiiPiS1_S1_S1_ib.exit

sw.bb1.i:                                         ; preds = %sw.bb.i, %entry
  %cmp2.i = icmp sgt i32 %chunk, 0
  br i1 %cmp2.i, label %if.then3.i, label %sw.bb14.i

if.then3.i:                                       ; preds = %sw.bb1.i
  %sub.i = sub i32 %call.i, %0
  %sub5.i = add i32 %sub.i, %1
  %div.i = sdiv i32 %sub5.i, %call.i
  %add6.i = add i32 %chunk, -1
  %sub7.i = add i32 %add6.i, %div.i
  %neg.i = sub i32 0, %chunk
  %and9.i = and i32 %sub7.i, %neg.i
  %mul.i109.i = mul nsw i32 %and9.i, %call.i
  %mul1.i110.i = mul nsw i32 %and9.i, %global_tid
  %add.i111.i = add nsw i32 %mul1.i110.i, %0
  %add2.i112.i = add i32 %and9.i, -1
  %sub.i113.i = add i32 %add2.i112.i, %add.i111.i
  %rem.i114.i = srem i32 %1, %and9.i
  %sub3.i115.i = sub i32 %1, %rem.i114.i
  %sub4.i116.i = sub i32 %sub3.i115.i, %add.i111.i
  %rem5.i117.i = srem i32 %sub4.i116.i, %mul.i109.i
  %cmp.i118.i = icmp eq i32 %rem5.i117.i, 0
  %cmp10.i = icmp sgt i32 %sub.i113.i, %1
  %spec.select.i = select i1 %cmp10.i, i32 %1, i32 %sub.i113.i
  br label %_ZN27omptarget_nvptx_LoopSupportIiiE15for_static_initEiiPiS1_S1_S1_ib.exit

sw.bb14.i:                                        ; preds = %sw.bb1.i, %entry
  %sub.i88.i = sub nsw i32 %1, %0
  %add.i89.i = add nsw i32 %sub.i88.i, 1
  %div.i90.i = sdiv i32 %add.i89.i, %call.i
  %mul.i91.i = mul nsw i32 %div.i90.i, %call.i
  %sub1.i92.i = sub nsw i32 %add.i89.i, %mul.i91.i
  %cmp.i93.i = icmp sgt i32 %sub1.i92.i, %global_tid
  br i1 %cmp.i93.i, label %if.then.i97.i, label %if.else.i101.i

if.then.i97.i:                                    ; preds = %sw.bb14.i
  %inc.i94.i = add nsw i32 %div.i90.i, 1
  %mul2.i95.i = mul nsw i32 %inc.i94.i, %global_tid
  %add3.i96.i = add nsw i32 %mul2.i95.i, %0
  br label %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit108.i

if.else.i101.i:                                   ; preds = %sw.bb14.i
  %mul4.i98.i = mul nsw i32 %div.i90.i, %global_tid
  %add5.i99.i = add i32 %mul4.i98.i, %0
  %add6.i100.i = add i32 %add5.i99.i, %sub1.i92.i
  br label %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit108.i

_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit108.i: ; preds = %if.else.i101.i, %if.then.i97.i
  %chunk.addr.0.i = phi i32 [ %inc.i94.i, %if.then.i97.i ], [ %div.i90.i, %if.else.i101.i ]
  %storemerge.i102.i = phi i32 [ %add3.i96.i, %if.then.i97.i ], [ %add6.i100.i, %if.else.i101.i ]
  %add7.i103.i = add nsw i32 %storemerge.i102.i, %chunk.addr.0.i
  %sub8.i104.i = add nsw i32 %add7.i103.i, -1
  %cmp9.i105.i = icmp sle i32 %storemerge.i102.i, %1
  %cmp10.i106.i = icmp slt i32 %1, %add7.i103.i
  %narrow.i107.i = and i1 %cmp9.i105.i, %cmp10.i106.i
  br label %_ZN27omptarget_nvptx_LoopSupportIiiE15for_static_initEiiPiS1_S1_S1_ib.exit

sw.bb15.i:                                        ; preds = %entry
  %cmp16.i = icmp sgt i32 %chunk, 0
  br i1 %cmp16.i, label %if.then17.i, label %sw.bb21.i

if.then17.i:                                      ; preds = %sw.bb15.i
  %call18.i = call i32 @_Z12GetOmpTeamIdv() #14
  %call19.i = call i32 @_Z19GetNumberOfOmpTeamsv() #14
  %mul.i77.i = mul nsw i32 %call19.i, %chunk
  %mul1.i78.i = mul nsw i32 %call18.i, %chunk
  %add.i79.i = add nsw i32 %mul1.i78.i, %0
  %add2.i80.i = add i32 %chunk, -1
  %sub.i81.i = add i32 %add2.i80.i, %add.i79.i
  %rem.i82.i = srem i32 %1, %chunk
  %sub3.i83.i = sub i32 %1, %rem.i82.i
  %sub4.i84.i = sub i32 %sub3.i83.i, %add.i79.i
  %rem5.i85.i = srem i32 %sub4.i84.i, %mul.i77.i
  %cmp.i86.i = icmp eq i32 %rem5.i85.i, 0
  br label %_ZN27omptarget_nvptx_LoopSupportIiiE15for_static_initEiiPiS1_S1_S1_ib.exit

sw.bb21.i:                                        ; preds = %sw.bb15.i, %entry
  %call22.i = call i32 @_Z12GetOmpTeamIdv() #14
  %call23.i = call i32 @_Z19GetNumberOfOmpTeamsv() #14
  %sub.i73.i = sub nsw i32 %1, %0
  %add.i74.i = add nsw i32 %sub.i73.i, 1
  %div.i.i = sdiv i32 %add.i74.i, %call23.i
  %mul.i75.i = mul nsw i32 %div.i.i, %call23.i
  %sub1.i.i = sub nsw i32 %add.i74.i, %mul.i75.i
  %cmp.i76.i = icmp sgt i32 %sub1.i.i, %call22.i
  br i1 %cmp.i76.i, label %if.then.i.i, label %if.else.i.i

if.then.i.i:                                      ; preds = %sw.bb21.i
  %inc.i.i = add nsw i32 %div.i.i, 1
  %mul2.i.i = mul nsw i32 %inc.i.i, %call22.i
  %add3.i.i = add nsw i32 %mul2.i.i, %0
  br label %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit.i

if.else.i.i:                                      ; preds = %sw.bb21.i
  %mul4.i.i = mul nsw i32 %div.i.i, %call22.i
  %add5.i.i = add i32 %mul4.i.i, %0
  %add6.i.i = add i32 %add5.i.i, %sub1.i.i
  br label %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit.i

_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit.i: ; preds = %if.else.i.i, %if.then.i.i
  %chunk.addr.1.i = phi i32 [ %inc.i.i, %if.then.i.i ], [ %div.i.i, %if.else.i.i ]
  %storemerge.i.i = phi i32 [ %add3.i.i, %if.then.i.i ], [ %add6.i.i, %if.else.i.i ]
  %add7.i.i = add nsw i32 %storemerge.i.i, %chunk.addr.1.i
  %sub8.i.i = add nsw i32 %add7.i.i, -1
  %cmp9.i.i = icmp sle i32 %storemerge.i.i, %1
  %cmp10.i.i = icmp slt i32 %1, %add7.i.i
  %narrow.i.i = and i1 %cmp9.i.i, %cmp10.i.i
  br label %_ZN27omptarget_nvptx_LoopSupportIiiE15for_static_initEiiPiS1_S1_S1_ib.exit

sw.bb24.i:                                        ; preds = %entry
  %call25.i = call i32 @_Z12GetOmpTeamIdv() #14
  %mul.i = mul nsw i32 %call25.i, %call.i
  %add26.i = add nsw i32 %mul.i, %global_tid
  %call27.i = call i32 @_Z19GetNumberOfOmpTeamsv() #14
  %mul28.i = mul i32 %call.i, %chunk
  %mul.i62.i = mul i32 %mul28.i, %call27.i
  %mul1.i63.i = mul nsw i32 %add26.i, %chunk
  %add.i64.i = add nsw i32 %mul1.i63.i, %0
  %add2.i65.i = add i32 %chunk, -1
  %sub.i66.i = add i32 %add2.i65.i, %add.i64.i
  %rem.i67.i = srem i32 %1, %chunk
  %sub3.i68.i = sub i32 %1, %rem.i67.i
  %sub4.i69.i = sub i32 %sub3.i68.i, %add.i64.i
  %rem5.i70.i = srem i32 %sub4.i69.i, %mul.i62.i
  %cmp.i71.i = icmp eq i32 %rem5.i70.i, 0
  br label %_ZN27omptarget_nvptx_LoopSupportIiiE15for_static_initEiiPiS1_S1_S1_ib.exit

sw.default.i:                                     ; preds = %entry
  %mul.i51.i = mul nsw i32 %call.i, %chunk
  %mul1.i52.i = mul nsw i32 %chunk, %global_tid
  %add.i53.i = add nsw i32 %0, %mul1.i52.i
  %add2.i54.i = add i32 %chunk, -1
  %sub.i55.i = add i32 %add2.i54.i, %add.i53.i
  %rem.i56.i = srem i32 %1, %chunk
  %sub3.i57.i = sub i32 %1, %add.i53.i
  %sub4.i58.i = sub i32 %sub3.i57.i, %rem.i56.i
  %rem5.i59.i = srem i32 %sub4.i58.i, %mul.i51.i
  %cmp.i60.i = icmp eq i32 %rem5.i59.i, 0
  br label %_ZN27omptarget_nvptx_LoopSupportIiiE15for_static_initEiiPiS1_S1_S1_ib.exit

_ZN27omptarget_nvptx_LoopSupportIiiE15for_static_initEiiPiS1_S1_S1_ib.exit: ; preds = %if.then.i, %if.then3.i, %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit108.i, %if.then17.i, %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit.i, %sw.bb24.i, %sw.default.i
  %lastiter.0.in.i = phi i1 [ %cmp.i60.i, %sw.default.i ], [ %cmp.i71.i, %sw.bb24.i ], [ %narrow.i.i, %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit.i ], [ %cmp.i86.i, %if.then17.i ], [ %narrow.i107.i, %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit108.i ], [ %cmp.i.i, %if.then.i ], [ %cmp.i118.i, %if.then3.i ]
  %lb.0.i = phi i32 [ %add.i53.i, %sw.default.i ], [ %add.i64.i, %sw.bb24.i ], [ %storemerge.i.i, %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit.i ], [ %add.i79.i, %if.then17.i ], [ %storemerge.i102.i, %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit108.i ], [ %add.i.i, %if.then.i ], [ %add.i111.i, %if.then3.i ]
  %ub.0.i = phi i32 [ %sub.i55.i, %sw.default.i ], [ %sub.i66.i, %sw.bb24.i ], [ %sub8.i.i, %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit.i ], [ %sub.i81.i, %if.then17.i ], [ %sub8.i104.i, %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit108.i ], [ %sub.i.i, %if.then.i ], [ %spec.select.i, %if.then3.i ]
  %stride.0.i = phi i32 [ %mul.i51.i, %sw.default.i ], [ %mul.i62.i, %sw.bb24.i ], [ %add.i74.i, %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit.i ], [ %mul.i77.i, %if.then17.i ], [ %add.i89.i, %_ZN27omptarget_nvptx_LoopSupportIiiE16ForStaticNoChunkERiS1_S1_S1_S1_ii.exit108.i ], [ %mul.i.i, %if.then.i ], [ %mul.i109.i, %if.then3.i ]
  %lastiter.0.i = zext i1 %lastiter.0.in.i to i32
  store i32 %lastiter.0.i, i32* %plastiter, align 4, !tbaa !13
  store i32 %lb.0.i, i32* %plower, align 4, !tbaa !13
  store i32 %ub.0.i, i32* %pupper, align 4, !tbaa !13
  store i32 %stride.0.i, i32* %pstride, align 4, !tbaa !13
  ret void
}

; Function Attrs: convergent norecurse nounwind readonly
define internal zeroext i1 @_Z13checkSPMDModeP5ident(%struct.ident_t* readonly %loc) local_unnamed_addr #3 {
entry:
  %tobool = icmp eq %struct.ident_t* %loc, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call zeroext i1 @_Z10isSPMDModev() #13
  br label %return

if.end:                                           ; preds = %entry
  %reserved_2 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %loc, i64 0, i32 2
  %0 = load i32, i32* %reserved_2, align 8, !tbaa !17
  %and = and i32 %0, 1
  %tobool1 = icmp eq i32 %and, 0
  br i1 %tobool1, label %if.end3, label %return

if.end3:                                          ; preds = %if.end
  %and5 = and i32 %0, 2
  %tobool6 = icmp eq i32 %and5, 0
  br i1 %tobool6, label %return, label %if.end8

if.end8:                                          ; preds = %if.end3
  %call9 = call zeroext i1 @_Z10isSPMDModev() #13
  br label %return

return:                                           ; preds = %if.end3, %if.end, %if.end8, %if.then
  %retval.0 = phi i1 [ %call9, %if.end8 ], [ %call, %if.then ], [ true, %if.end ], [ false, %if.end3 ]
  ret i1 %retval.0
}

; Function Attrs: convergent nounwind readonly
define internal i32 @_Z21GetNumberOfOmpThreadsb(i1 zeroext %isSPMDExecutionMode) local_unnamed_addr #4 {
entry:
  %call = call i32 @_Z9GetWarpIdv() #13
  %idxprom = zext i32 %call to i64
  %arrayidx8 = getelementptr inbounds [32 x i8], [32 x i8] addrspace(3)* @parallelLevel, i64 0, i64 %idxprom
  %arrayidx = addrspacecast i8 addrspace(3)* %arrayidx8 to i8*
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !20
  %cmp = icmp eq i8 %0, -127
  br i1 %cmp, label %if.else, label %if.end5

if.else:                                          ; preds = %entry
  br i1 %isSPMDExecutionMode, label %if.then1, label %if.else3

if.then1:                                         ; preds = %if.else
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #13, !range !12
  br label %if.end5

if.else3:                                         ; preds = %if.else
  %2 = load i16, i16* addrspacecast (i16 addrspace(3)* @threadsInTeam to i16*), align 2, !tbaa !21
  %conv4 = zext i16 %2 to i32
  br label %if.end5

if.end5:                                          ; preds = %entry, %if.then1, %if.else3
  %rc.0 = phi i32 [ %1, %if.then1 ], [ %conv4, %if.else3 ], [ 1, %entry ]
  ret i32 %rc.0
}

; Function Attrs: nounwind readnone
define internal i32 @_Z12GetOmpTeamIdv() local_unnamed_addr #5 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #13, !range !23
  ret i32 %0
}

; Function Attrs: nounwind readnone
define internal i32 @_Z19GetNumberOfOmpTeamsv() local_unnamed_addr #5 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #13, !range !24
  ret i32 %0
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #6

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #6

; Function Attrs: nounwind readnone
define internal i32 @_Z9GetWarpIdv() local_unnamed_addr #5 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #13, !range !25
  %div = lshr i32 %0, 5
  ret i32 %div
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #6

; Function Attrs: norecurse nounwind readonly
define internal zeroext i1 @_Z10isSPMDModev() local_unnamed_addr #7 {
entry:
  %0 = load i32, i32* addrspacecast (i32 addrspace(3)* @execution_param to i32*), align 4, !tbaa !13
  %and = and i32 %0, 1
  %cmp = icmp ne i32 %and, 0
  ret i1 %cmp
}

; Function Attrs: norecurse nounwind readnone
define internal void @__kmpc_for_static_fini(%struct.ident_t* nocapture %loc, i32 %global_tid) #8 {
entry:
  ret void
}

; Function Attrs: convergent nounwind
define internal void @__kmpc_spmd_kernel_init(i32 %ThreadLimit, i16 signext %RequiresOMPRuntime, i16 signext %RequiresDataSharing) #2 {
entry:
  %tobool = icmp ne i16 %RequiresOMPRuntime, 0
  %cond = select i1 %tobool, i32 0, i32 2
  call void @_Z22setExecutionParameters13ExecutionMode11RuntimeMode(i32 1, i32 %cond) #14
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #13, !range !25
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = call i32 asm "mov.u32 $0, %smid;", "=r"() #15, !srcloc !26
  %rem = and i32 %1, 15
  store i32 %rem, i32* addrspacecast (i32 addrspace(3)* @usedSlotIdx to i32*), align 4, !tbaa !13
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #13, !range !12
  %cmp3 = icmp ugt i32 %2, 1
  %add = select i1 %cmp3, i8 -127, i8 1
  store i8 %add, i8* getelementptr inbounds ([32 x i8], [32 x i8]* addrspacecast ([32 x i8] addrspace(3)* @parallelLevel to [32 x i8]*), i64 0, i64 0), align 1, !tbaa !20
  br label %if.end14

if.else:                                          ; preds = %entry
  %call5 = call i32 @_Z9GetLaneIdv() #14
  %cmp6 = icmp eq i32 %call5, 0
  br i1 %cmp6, label %if.then7, label %if.end14

if.then7:                                         ; preds = %if.else
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #13, !range !12
  %cmp9 = icmp ugt i32 %3, 1
  %add11 = select i1 %cmp9, i8 -127, i8 1
  %call13 = call i32 @_Z9GetWarpIdv() #14
  %idxprom = zext i32 %call13 to i64
  %arrayidx64 = getelementptr inbounds [32 x i8], [32 x i8] addrspace(3)* @parallelLevel, i64 0, i64 %idxprom
  %arrayidx = addrspacecast i8 addrspace(3)* %arrayidx64 to i8*
  store i8 %add11, i8* %arrayidx, align 1, !tbaa !20
  br label %if.end14

if.end14:                                         ; preds = %if.else, %if.then7, %if.then
  br i1 %tobool, label %if.end17, label %if.then16

if.then16:                                        ; preds = %if.end14
  call void @llvm.nvvm.barrier0() #13
  br label %cleanup

if.end17:                                         ; preds = %if.end14
  br i1 %cmp, label %if.then19, label %if.end25

if.then19:                                        ; preds = %if.end17
  %4 = load i32, i32* addrspacecast (i32 addrspace(3)* @usedSlotIdx to i32*), align 4, !tbaa !13
  %idxprom20 = zext i32 %4 to i64
  %arrayidx2163 = getelementptr inbounds [16 x %class.omptarget_nvptx_Queue], [16 x %class.omptarget_nvptx_Queue] addrspace(1)* @omptarget_nvptx_device_State, i64 0, i64 %idxprom20
  %arrayidx21 = addrspacecast %class.omptarget_nvptx_Queue addrspace(1)* %arrayidx2163 to %class.omptarget_nvptx_Queue*
  %head.i.i = getelementptr inbounds %class.omptarget_nvptx_Queue, %class.omptarget_nvptx_Queue* %arrayidx21, i64 0, i32 2
  %call.i.i.i = call fastcc i32 @_ZL9atomicAddPjj(i32* nonnull %head.i.i, i32 1) #13
  %rem.i = and i32 %call.i.i.i, 15
  %div.i.i = lshr i32 %call.i.i.i, 4
  %mul.i.i = shl nuw nsw i32 %div.i.i, 1
  %idxprom.i16.i = zext i32 %rem.i to i64
  %arrayidx.i17.i = getelementptr inbounds %class.omptarget_nvptx_Queue, %class.omptarget_nvptx_Queue* %arrayidx21, i64 0, i32 3, i64 %idxprom.i16.i
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.cond.i, %if.then19
  %call.i.i18.i = call fastcc i32 @_ZL9atomicAddPjj(i32* nonnull %arrayidx.i17.i, i32 0) #13
  %cmp.i.i = icmp eq i32 %call.i.i18.i, %mul.i.i
  br i1 %cmp.i.i, label %_ZN21omptarget_nvptx_QueueI36omptarget_nvptx_ThreadPrivateContextLj16EE7DequeueEv.exit, label %while.cond.i

_ZN21omptarget_nvptx_QueueI36omptarget_nvptx_ThreadPrivateContextLj16EE7DequeueEv.exit: ; preds = %while.cond.i
  %arrayidx.i20.i = getelementptr inbounds %class.omptarget_nvptx_Queue, %class.omptarget_nvptx_Queue* %arrayidx21, i64 0, i32 1, i64 %idxprom.i16.i
  %5 = bitcast %class.omptarget_nvptx_ThreadPrivateContext** %arrayidx.i20.i to i64*
  %call.i.i21.i = call fastcc i64 @_ZL9atomicAddPyy16(i64* nonnull %5, i64 0) #13
  %6 = inttoptr i64 %call.i.i21.i to %class.omptarget_nvptx_ThreadPrivateContext*
  %cmp.i71 = icmp eq i64 %call.i.i21.i, 0
  %arrayidx.i72 = getelementptr inbounds %class.omptarget_nvptx_Queue, %class.omptarget_nvptx_Queue* %arrayidx21, i64 0, i32 0, i64 %idxprom.i16.i
  %element.0.i = select i1 %cmp.i71, %class.omptarget_nvptx_ThreadPrivateContext* %arrayidx.i72, %class.omptarget_nvptx_ThreadPrivateContext* %6
  %add.i.i = and i32 %mul.i.i, 67108862
  %rem.i.i = or i32 %add.i.i, 1
  %call.i.i15.i = call fastcc i32 @_ZL10atomicExchPjj17(i32* nonnull %arrayidx.i17.i, i32 %rem.i.i) #13
  store %class.omptarget_nvptx_ThreadPrivateContext* %element.0.i, %class.omptarget_nvptx_ThreadPrivateContext** addrspacecast (%class.omptarget_nvptx_ThreadPrivateContext* addrspace(3)* @omptarget_nvptx_threadPrivateContext to %class.omptarget_nvptx_ThreadPrivateContext**), align 8, !tbaa !27
  %flags.i.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %element.0.i, i64 0, i32 0, i32 0, i32 1, i32 0
  store i8 0, i8* %flags.i.i, align 8, !tbaa !28
  %threadId.i.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %element.0.i, i64 0, i32 0, i32 0, i32 1, i32 2
  store i16 0, i16* %threadId.i.i, align 2, !tbaa !34
  %runtimeChunkSize.i.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %element.0.i, i64 0, i32 0, i32 0, i32 1, i32 3
  store i64 1, i64* %runtimeChunkSize.i.i, align 8, !tbaa !35
  br label %if.end25

if.end25:                                         ; preds = %_ZN21omptarget_nvptx_QueueI36omptarget_nvptx_ThreadPrivateContextLj16EE7DequeueEv.exit, %if.end17
  call void @llvm.nvvm.barrier0() #13
  %7 = load %class.omptarget_nvptx_ThreadPrivateContext*, %class.omptarget_nvptx_ThreadPrivateContext** addrspacecast (%class.omptarget_nvptx_ThreadPrivateContext* addrspace(3)* @omptarget_nvptx_threadPrivateContext to %class.omptarget_nvptx_ThreadPrivateContext**), align 8, !tbaa !27
  %idxprom.i67 = zext i32 %0 to i64
  %arrayidx.i68 = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 1, i64 %idxprom.i67
  %levelZeroTaskDescr.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 0, i32 0
  %flags.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 1, i64 %idxprom.i67, i32 1, i32 0
  store i8 48, i8* %flags.i, align 8, !tbaa !28
  %conv.i = trunc i32 %0 to i16
  %threadId.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 1, i64 %idxprom.i67, i32 1, i32 2
  store i16 %conv.i, i16* %threadId.i, align 2, !tbaa !34
  %runtimeChunkSize.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 1, i64 %idxprom.i67, i32 1, i32 3
  store i64 1, i64* %runtimeChunkSize.i, align 8, !tbaa !35
  %prev.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 1, i64 %idxprom.i67, i32 2
  store %class.omptarget_nvptx_TaskDescr* %levelZeroTaskDescr.i, %class.omptarget_nvptx_TaskDescr** %prev.i, align 8, !tbaa !36
  %8 = load %class.omptarget_nvptx_ThreadPrivateContext*, %class.omptarget_nvptx_ThreadPrivateContext** addrspacecast (%class.omptarget_nvptx_ThreadPrivateContext* addrspace(3)* @omptarget_nvptx_threadPrivateContext to %class.omptarget_nvptx_ThreadPrivateContext**), align 8, !tbaa !27
  %arrayidx.i66 = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %8, i64 0, i32 2, i64 %idxprom.i67
  store %class.omptarget_nvptx_TaskDescr* %arrayidx.i68, %class.omptarget_nvptx_TaskDescr** %arrayidx.i66, align 8, !tbaa !27
  %tobool32 = icmp eq i16 %RequiresDataSharing, 0
  br i1 %tobool32, label %cleanup, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end25
  %call33 = call i32 @_Z9GetLaneIdv() #14
  %cmp34 = icmp eq i32 %call33, 0
  br i1 %cmp34, label %if.then35, label %cleanup

if.then35:                                        ; preds = %land.lhs.true
  %div = lshr i32 %0, 5
  %9 = and i32 %0, 992
  %10 = icmp eq i32 %9, 992
  br i1 %10, label %if.then.i, label %if.end22.i

if.then.i:                                        ; preds = %if.then35
  %arrayidx.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 0, i32 5, i64 0
  %DataEnd.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 0, i32 5, i64 0, i32 3
  %11 = load i8*, i8** %DataEnd.i, align 8, !tbaa !37
  %add.ptr.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 0, i32 5, i64 0, i32 4, i64 256
  %cmp.i = icmp eq i8* %11, %add.ptr.i
  br i1 %cmp.i, label %_ZN25omptarget_nvptx_TeamDescr5RootSEib.exit, label %if.end.i

if.end.i:                                         ; preds = %if.then.i
  store i8* %add.ptr.i, i8** %DataEnd.i, align 8, !tbaa !37
  %Next.i = getelementptr inbounds %struct.__kmpc_data_sharing_master_slot_static, %struct.__kmpc_data_sharing_master_slot_static* %arrayidx.i, i64 0, i32 0
  store %struct.__kmpc_data_sharing_slot* null, %struct.__kmpc_data_sharing_slot** %Next.i, align 16, !tbaa !39
  %Prev.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 0, i32 5, i64 0, i32 1
  store %struct.__kmpc_data_sharing_slot* null, %struct.__kmpc_data_sharing_slot** %Prev.i, align 8, !tbaa !40
  %PrevSlotStackPtr.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 0, i32 5, i64 0, i32 2
  store i8* null, i8** %PrevSlotStackPtr.i, align 16, !tbaa !41
  %12 = bitcast %struct.__kmpc_data_sharing_master_slot_static* %arrayidx.i to %struct.__kmpc_data_sharing_slot*
  br label %_ZN25omptarget_nvptx_TeamDescr5RootSEib.exit

if.end22.i:                                       ; preds = %if.then35
  %idxprom.i = zext i32 %div to i64
  %arrayidx23.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 0, i32 4, i64 %idxprom.i
  %DataEnd24.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 0, i32 4, i64 %idxprom.i, i32 3
  %13 = load i8*, i8** %DataEnd24.i, align 8, !tbaa !42
  %add.ptr30.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 0, i32 4, i64 %idxprom.i, i32 4, i64 8192
  %cmp31.i = icmp eq i8* %13, %add.ptr30.i
  br i1 %cmp31.i, label %_ZN25omptarget_nvptx_TeamDescr5RootSEib.exit, label %if.end33.i

if.end33.i:                                       ; preds = %if.end22.i
  store i8* %add.ptr30.i, i8** %DataEnd24.i, align 8, !tbaa !42
  %Next47.i = getelementptr inbounds %struct.__kmpc_data_sharing_worker_slot_static, %struct.__kmpc_data_sharing_worker_slot_static* %arrayidx23.i, i64 0, i32 0
  store %struct.__kmpc_data_sharing_slot* null, %struct.__kmpc_data_sharing_slot** %Next47.i, align 16, !tbaa !44
  %Prev51.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 0, i32 4, i64 %idxprom.i, i32 1
  store %struct.__kmpc_data_sharing_slot* null, %struct.__kmpc_data_sharing_slot** %Prev51.i, align 8, !tbaa !45
  %PrevSlotStackPtr55.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %7, i64 0, i32 0, i32 4, i64 %idxprom.i, i32 2
  store i8* null, i8** %PrevSlotStackPtr55.i, align 16, !tbaa !46
  %14 = bitcast %struct.__kmpc_data_sharing_worker_slot_static* %arrayidx23.i to %struct.__kmpc_data_sharing_slot*
  br label %_ZN25omptarget_nvptx_TeamDescr5RootSEib.exit

_ZN25omptarget_nvptx_TeamDescr5RootSEib.exit:     ; preds = %if.then.i, %if.end.i, %if.end22.i, %if.end33.i
  %retval.0.i = phi %struct.__kmpc_data_sharing_slot* [ %12, %if.end.i ], [ %14, %if.end33.i ], [ null, %if.then.i ], [ null, %if.end22.i ]
  %idxprom38 = zext i32 %div to i64
  %arrayidx39 = getelementptr inbounds %struct.DataSharingStateTy, %struct.DataSharingStateTy* addrspacecast (%struct.DataSharingStateTy addrspace(3)* @DataSharingState to %struct.DataSharingStateTy*), i64 0, i32 0, i64 %idxprom38
  store %struct.__kmpc_data_sharing_slot* %retval.0.i, %struct.__kmpc_data_sharing_slot** %arrayidx39, align 8, !tbaa !27
  %arrayidx40 = getelementptr inbounds %struct.__kmpc_data_sharing_slot, %struct.__kmpc_data_sharing_slot* %retval.0.i, i64 0, i32 4, i64 0
  %arrayidx42 = getelementptr %struct.DataSharingStateTy, %struct.DataSharingStateTy* addrspacecast (%struct.DataSharingStateTy addrspace(3)* @DataSharingState to %struct.DataSharingStateTy*), i64 0, i32 1, i64 %idxprom38
  store i8* %arrayidx40, i8** %arrayidx42, align 8, !tbaa !27
  br label %cleanup

cleanup:                                          ; preds = %land.lhs.true, %_ZN25omptarget_nvptx_TeamDescr5RootSEib.exit, %if.end25, %if.then16
  ret void
}

; Function Attrs: nofree norecurse nounwind writeonly
define internal void @_Z22setExecutionParameters13ExecutionMode11RuntimeMode(i32 %EMode, i32 %RMode) local_unnamed_addr #9 {
entry:
  %or = or i32 %RMode, %EMode
  store i32 %or, i32* addrspacecast (i32 addrspace(3)* @execution_param to i32*), align 4, !tbaa !13
  ret void
}

; Function Attrs: nounwind readnone
define internal i32 @_Z9GetLaneIdv() local_unnamed_addr #5 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #13, !range !25
  %and = and i32 %0, 31
  ret i32 %and
}

; Function Attrs: convergent nounwind
declare void @llvm.nvvm.barrier0() #10

; Function Attrs: inlinehint nofree norecurse nounwind
define internal fastcc i32 @_ZL9atomicAddPjj(i32* nocapture %address, i32 %val) unnamed_addr #11 {
entry:
  %0 = atomicrmw add i32* %address, i32 %val seq_cst
  ret i32 %0
}

; Function Attrs: inlinehint nofree norecurse nounwind
define internal fastcc i64 @_ZL9atomicAddPyy16(i64* nocapture %address, i64 %val) unnamed_addr #11 {
entry:
  %0 = atomicrmw add i64* %address, i64 %val seq_cst
  ret i64 %0
}

; Function Attrs: inlinehint nofree norecurse nounwind
define internal fastcc i32 @_ZL10atomicExchPjj17(i32* nocapture %address, i32 %val) unnamed_addr #11 {
entry:
  %0 = atomicrmw xchg i32* %address, i32 %val seq_cst
  ret i32 %0
}

; Function Attrs: convergent nounwind
define internal void @__kmpc_spmd_kernel_deinit_v2(i16 signext %RequiresOMPRuntime) #2 {
entry:
  %tobool = icmp eq i16 %RequiresOMPRuntime, 0
  br i1 %tobool, label %return, label %if.end

if.end:                                           ; preds = %entry
  call void @llvm.nvvm.barrier0() #13
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #13, !range !25
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then1, label %return

if.then1:                                         ; preds = %if.end
  %1 = load i32, i32* addrspacecast (i32 addrspace(3)* @usedSlotIdx to i32*), align 4, !tbaa !13
  %idxprom = sext i32 %1 to i64
  %arrayidx5 = getelementptr inbounds [16 x %class.omptarget_nvptx_Queue], [16 x %class.omptarget_nvptx_Queue] addrspace(1)* @omptarget_nvptx_device_State, i64 0, i64 %idxprom
  %arrayidx = addrspacecast %class.omptarget_nvptx_Queue addrspace(1)* %arrayidx5 to %class.omptarget_nvptx_Queue*
  %2 = load i64, i64* addrspacecast (i64 addrspace(3)* bitcast (%class.omptarget_nvptx_ThreadPrivateContext* addrspace(3)* @omptarget_nvptx_threadPrivateContext to i64 addrspace(3)*) to i64*), align 8, !tbaa !27
  %tail.i.i = getelementptr inbounds %class.omptarget_nvptx_Queue, %class.omptarget_nvptx_Queue* %arrayidx, i64 0, i32 4
  %call.i.i.i = call fastcc i32 @_ZL9atomicAddPjj(i32* nonnull %tail.i.i, i32 1) #13
  %rem.i = and i32 %call.i.i.i, 15
  %3 = lshr i32 %call.i.i.i, 3
  %add.i = or i32 %3, 1
  %idxprom.i12.i = zext i32 %rem.i to i64
  %arrayidx.i13.i = getelementptr inbounds %class.omptarget_nvptx_Queue, %class.omptarget_nvptx_Queue* %arrayidx, i64 0, i32 3, i64 %idxprom.i12.i
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.cond.i, %if.then1
  %call.i.i14.i = call fastcc i32 @_ZL9atomicAddPjj(i32* nonnull %arrayidx.i13.i, i32 0) #13
  %cmp.i.i = icmp eq i32 %call.i.i14.i, %add.i
  br i1 %cmp.i.i, label %_ZN21omptarget_nvptx_QueueI36omptarget_nvptx_ThreadPrivateContextLj16EE7EnqueueEPS0_.exit, label %while.cond.i

_ZN21omptarget_nvptx_QueueI36omptarget_nvptx_ThreadPrivateContextLj16EE7EnqueueEPS0_.exit: ; preds = %while.cond.i
  %arrayidx.i16.i = getelementptr inbounds %class.omptarget_nvptx_Queue, %class.omptarget_nvptx_Queue* %arrayidx, i64 0, i32 1, i64 %idxprom.i12.i
  %4 = bitcast %class.omptarget_nvptx_ThreadPrivateContext** %arrayidx.i16.i to i64*
  %call.i.i17.i = call fastcc i64 @_ZL10atomicExchPyy(i64* nonnull %4, i64 %2) #13
  %add.i.i = add nuw nsw i32 %add.i, 1
  %rem.i.i = and i32 %add.i.i, 67108862
  %call.i.i11.i = call fastcc i32 @_ZL10atomicExchPjj17(i32* nonnull %arrayidx.i13.i, i32 %rem.i.i) #13
  br label %return

return:                                           ; preds = %if.end, %_ZN21omptarget_nvptx_QueueI36omptarget_nvptx_ThreadPrivateContextLj16EE7EnqueueEPS0_.exit, %entry
  ret void
}

; Function Attrs: inlinehint nofree norecurse nounwind
define internal fastcc i64 @_ZL10atomicExchPyy(i64* nocapture %address, i64 %val) unnamed_addr #11 {
entry:
  %0 = atomicrmw xchg i64* %address, i64 %val seq_cst
  ret i64 %0
}

; Function Attrs: convergent nounwind
define internal i32 @__kmpc_global_thread_num(%struct.ident_t* %loc) #2 {
entry:
  %call = call zeroext i1 @_Z13checkSPMDModeP5ident(%struct.ident_t* %loc) #14
  %call1 = call i32 @_Z25GetLogicalThreadIdInBlockb(i1 zeroext %call) #14
  %call2 = call zeroext i1 @_Z13checkSPMDModeP5ident(%struct.ident_t* %loc) #14
  %call3 = call i32 @_Z14GetOmpThreadIdib(i32 %call1, i1 zeroext %call2) #14
  ret i32 %call3
}

; Function Attrs: convergent nounwind readnone
define internal i32 @_Z25GetLogicalThreadIdInBlockb(i1 zeroext %isSPMDExecutionMode) local_unnamed_addr #12 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #13, !range !25
  br i1 %isSPMDExecutionMode, label %if.else, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %call1 = call i32 @_Z17GetMasterThreadIDv() #13
  %cmp = icmp slt i32 %0, %call1
  br i1 %cmp, label %if.else, label %cleanup

if.else:                                          ; preds = %land.lhs.true, %entry
  br label %cleanup

cleanup:                                          ; preds = %land.lhs.true, %if.else
  %retval.0 = phi i32 [ %0, %if.else ], [ 0, %land.lhs.true ]
  ret i32 %retval.0
}

; Function Attrs: convergent nounwind readonly
define internal i32 @_Z14GetOmpThreadIdib(i32 %threadId, i1 zeroext %isSPMDExecutionMode) local_unnamed_addr #4 {
entry:
  %call = call i32 @_Z9GetWarpIdv() #13
  %idxprom = zext i32 %call to i64
  %arrayidx10 = getelementptr inbounds [32 x i8], [32 x i8] addrspace(3)* @parallelLevel, i64 0, i64 %idxprom
  %arrayidx = addrspacecast i8 addrspace(3)* %arrayidx10 to i8*
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !20
  %1 = and i8 %0, 126
  %cmp = icmp eq i8 %1, 0
  br i1 %cmp, label %if.else, label %if.end7

if.else:                                          ; preds = %entry
  br i1 %isSPMDExecutionMode, label %if.then1, label %if.else3

if.then1:                                         ; preds = %if.else
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x() #13, !range !25
  br label %if.end7

if.else3:                                         ; preds = %if.else
  %3 = load %class.omptarget_nvptx_ThreadPrivateContext*, %class.omptarget_nvptx_ThreadPrivateContext** addrspacecast (%class.omptarget_nvptx_ThreadPrivateContext* addrspace(3)* @omptarget_nvptx_threadPrivateContext to %class.omptarget_nvptx_ThreadPrivateContext**), align 8, !tbaa !27
  %idxprom.i = sext i32 %threadId to i64
  %arrayidx.i = getelementptr inbounds %class.omptarget_nvptx_ThreadPrivateContext, %class.omptarget_nvptx_ThreadPrivateContext* %3, i64 0, i32 2, i64 %idxprom.i
  %4 = load %class.omptarget_nvptx_TaskDescr*, %class.omptarget_nvptx_TaskDescr** %arrayidx.i, align 8, !tbaa !27
  %threadId.i = getelementptr inbounds %class.omptarget_nvptx_TaskDescr, %class.omptarget_nvptx_TaskDescr* %4, i64 0, i32 1, i32 2
  %5 = load i16, i16* %threadId.i, align 2, !tbaa !21
  %conv6 = zext i16 %5 to i32
  br label %if.end7

if.end7:                                          ; preds = %entry, %if.then1, %if.else3
  %rc.0 = phi i32 [ %2, %if.then1 ], [ %conv6, %if.else3 ], [ 0, %entry ]
  ret i32 %rc.0
}

; Function Attrs: nounwind readnone
define internal i32 @_Z17GetMasterThreadIDv() local_unnamed_addr #5 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #13, !range !12
  %sub = add nsw i32 %0, -1
  %and = and i32 %sub, -32
  ret i32 %and
}

attributes #0 = { noinline norecurse nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_37" "target-features"="+ptx64,+sm_37" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_37" "target-features"="+ptx64,+sm_37" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { convergent norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_37" "target-features"="+ptx64,+sm_37" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { convergent nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_37" "target-features"="+ptx64,+sm_37" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_37" "target-features"="+ptx64,+sm_37" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_37" "target-features"="+ptx64,+sm_37" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_37" "target-features"="+ptx64,+sm_37" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nofree norecurse nounwind writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_37" "target-features"="+ptx64,+sm_37" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { convergent nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { inlinehint nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_37" "target-features"="+ptx64,+sm_37" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { convergent nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_37" "target-features"="+ptx64,+sm_37" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nounwind }
attributes #14 = { convergent nounwind }
attributes #15 = { convergent nounwind readnone }

!llvm.module.flags = !{!0, !1, !2, !3}
!omp_offload.info = !{!4}
!nvvm.annotations = !{!5, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8}
!llvm.ident = !{!10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10, !10}
!nvvmir.version = !{!11, !11, !11, !11, !11, !11, !11, !11, !11, !11, !11, !11, !11}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!4 = !{i32 0, i32 64768, i32 101864634, !"main", i32 14, i32 0}
!5 = !{void (i32*, i32*, i32*)* @__omp_offloading_fd00_61254ba_main_l14, !"kernel", i32 1}
!6 = !{null, !"align", i32 8}
!7 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!8 = !{null, !"align", i32 16}
!9 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!10 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!11 = !{i32 1, i32 4}
!12 = !{i32 1, i32 1025}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C++ TBAA"}
!17 = !{!18, !14, i64 8}
!18 = !{!"_ZTS5ident", !14, i64 0, !14, i64 4, !14, i64 8, !14, i64 12, !19, i64 16}
!19 = !{!"any pointer", !15, i64 0}
!20 = !{!15, !15, i64 0}
!21 = !{!22, !22, i64 0}
!22 = !{!"short", !15, i64 0}
!23 = !{i32 0, i32 2147483647}
!24 = !{i32 1, i32 -2147483648}
!25 = !{i32 0, i32 1024}
!26 = !{i32 3582611}
!27 = !{!19, !19, i64 0}
!28 = !{!29, !15, i64 40}
!29 = !{!"_ZTS25omptarget_nvptx_TaskDescr", !30, i64 0, !33, i64 40, !19, i64 56}
!30 = !{!"_ZTSN25omptarget_nvptx_TaskDescr20SavedLoopDescr_itemsE", !31, i64 0, !31, i64 8, !31, i64 16, !31, i64 24, !32, i64 32}
!31 = !{!"long", !15, i64 0}
!32 = !{!"_ZTS11kmp_sched_t", !15, i64 0}
!33 = !{!"_ZTSN25omptarget_nvptx_TaskDescr15TaskDescr_itemsE", !15, i64 0, !15, i64 1, !22, i64 2, !31, i64 8}
!34 = !{!29, !22, i64 42}
!35 = !{!29, !31, i64 48}
!36 = !{!29, !19, i64 56}
!37 = !{!38, !19, i64 24}
!38 = !{!"_ZTS38__kmpc_data_sharing_master_slot_static", !19, i64 0, !19, i64 8, !19, i64 16, !19, i64 24, !15, i64 32}
!39 = !{!38, !19, i64 0}
!40 = !{!38, !19, i64 8}
!41 = !{!38, !19, i64 16}
!42 = !{!43, !19, i64 24}
!43 = !{!"_ZTS38__kmpc_data_sharing_worker_slot_static", !19, i64 0, !19, i64 8, !19, i64 16, !19, i64 24, !15, i64 32}
!44 = !{!43, !19, i64 0}
!45 = !{!43, !19, i64 8}
!46 = !{!43, !19, i64 16}

; __CLANG_OFFLOAD_BUNDLE____END__ openmp-nvptx64

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = '/tmp/target-be87a1.bc'
source_filename = "target.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct.__tgt_offload_entry = type { i8*, i8*, i64, i32, i32 }

@__const.main.a = private unnamed_addr constant [3 x i32] [i32 3, i32 4, i32 5], align 4
@.str = private unnamed_addr constant [19 x i8] c"Test0 %d, %d, %d.\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0) }, align 8
@.str.2 = private unnamed_addr constant [19 x i8] c"Test1 %d, %d, %d.\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Test2 %d, %d, %d.\0A\00", align 1
@1 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0) }, align 8
@.__omp_offloading_fd00_61254ba_main_l14.region_id = weak constant i8 0
@.offload_sizes = private unnamed_addr constant [3 x i64] [i64 4, i64 4, i64 4]
@.offload_maptypes = private unnamed_addr constant [3 x i64] [i64 33, i64 34, i64 35]
@.str.4 = private unnamed_addr constant [19 x i8] c"Test3 %d, %d, %d.\0A\00", align 1
@.omp_offloading.entry_name = internal unnamed_addr constant [39 x i8] c"__omp_offloading_fd00_61254ba_main_l14\00"
@.omp_offloading.entry.__omp_offloading_fd00_61254ba_main_l14 = weak constant %struct.__tgt_offload_entry { i8* @.__omp_offloading_fd00_61254ba_main_l14.region_id, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.omp_offloading.entry_name, i32 0, i32 0), i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @.omp_offloading.requires_reg, i8* null }]

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %a = alloca [3 x i32], align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %.offload_baseptrs = alloca [3 x i8*], align 8
  %.offload_ptrs = alloca [3 x i8*], align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = bitcast [3 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast ([3 x i32]* @__const.main.a to i8*), i64 12, i1 false)
  store i32 4, i32* %b, align 4
  store i32 6, i32* %c, align 4
  store i32 8, i32* %d, align 4
  %1 = load i32, i32* %b, align 4
  %2 = load i32, i32* %c, align 4
  %3 = load i32, i32* %d, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i32 %1, i32 %2, i32 %3)
  %4 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_baseptrs, i32 0, i32 0
  %5 = bitcast i8** %4 to i32**
  store i32* %b, i32** %5, align 8
  %6 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_ptrs, i32 0, i32 0
  %7 = bitcast i8** %6 to i32**
  store i32* %b, i32** %7, align 8
  %8 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_baseptrs, i32 0, i32 1
  %9 = bitcast i8** %8 to i32**
  store i32* %c, i32** %9, align 8
  %10 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_ptrs, i32 0, i32 1
  %11 = bitcast i8** %10 to i32**
  store i32* %c, i32** %11, align 8
  %12 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_baseptrs, i32 0, i32 2
  %13 = bitcast i8** %12 to i32**
  store i32* %d, i32** %13, align 8
  %14 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_ptrs, i32 0, i32 2
  %15 = bitcast i8** %14 to i32**
  store i32* %d, i32** %15, align 8
  %16 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_baseptrs, i32 0, i32 0
  %17 = getelementptr inbounds [3 x i8*], [3 x i8*]* %.offload_ptrs, i32 0, i32 0
  %18 = call i32 @__tgt_target_teams(i64 -1, i8* @.__omp_offloading_fd00_61254ba_main_l14.region_id, i32 3, i8** %16, i8** %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @.offload_sizes, i32 0, i32 0), i64* getelementptr inbounds ([3 x i64], [3 x i64]* @.offload_maptypes, i32 0, i32 0), i32 1, i32 0)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %omp_offload.failed, label %omp_offload.cont

omp_offload.failed:                               ; preds = %entry
  call void @__omp_offloading_fd00_61254ba_main_l14(i32* %b, i32* %c, i32* %d) #5
  br label %omp_offload.cont

omp_offload.cont:                                 ; preds = %omp_offload.failed, %entry
  %20 = load i32, i32* %b, align 4
  %21 = load i32, i32* %c, align 4
  %22 = load i32, i32* %d, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0), i32 %20, i32 %21, i32 %22)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @__omp_offloading_fd00_61254ba_main_l14(i32* dereferenceable(4) %b, i32* dereferenceable(4) %c, i32* dereferenceable(4) %d) #3 {
entry:
  %b.addr = alloca i32*, align 8
  %c.addr = alloca i32*, align 8
  %d.addr = alloca i32*, align 8
  store i32* %b, i32** %b.addr, align 8
  store i32* %c, i32** %c.addr, align 8
  store i32* %d, i32** %d.addr, align 8
  %0 = load i32*, i32** %b.addr, align 8
  %1 = load i32*, i32** %c.addr, align 8
  %2 = load i32*, i32** %d.addr, align 8
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* @1, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %0, i32* %1, i32* %2)
  ret void
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %b, i32* dereferenceable(4) %c, i32* dereferenceable(4) %d) #3 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  %c.addr = alloca i32*, align 8
  %d.addr = alloca i32*, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  store i32* %b, i32** %b.addr, align 8
  store i32* %c, i32** %c.addr, align 8
  store i32* %d, i32** %d.addr, align 8
  %0 = load i32*, i32** %b.addr, align 8
  %1 = load i32*, i32** %c.addr, align 8
  %2 = load i32*, i32** %d.addr, align 8
  store i32 0, i32* %.omp.lb, align 4
  store i32 2, i32* %.omp.ub, align 4
  store i32 1, i32* %.omp.stride, align 4
  store i32 0, i32* %.omp.is_last, align 4
  %3 = load i32*, i32** %.global_tid..addr, align 8
  %4 = load i32, i32* %3, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @0, i32 %4, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1)
  %5 = load i32, i32* %.omp.ub, align 4
  %cmp = icmp sgt i32 %5, 2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %6 = load i32, i32* %.omp.ub, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 2, %cond.true ], [ %6, %cond.false ]
  store i32 %cond, i32* %.omp.ub, align 4
  %7 = load i32, i32* %.omp.lb, align 4
  store i32 %7, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %8 = load i32, i32* %.omp.iv, align 4
  %9 = load i32, i32* %.omp.ub, align 4
  %cmp1 = icmp sle i32 %8, %9
  br i1 %cmp1, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %10 = load i32, i32* %.omp.iv, align 4
  %mul = mul nsw i32 %10, 1
  %add = add nsw i32 0, %mul
  store i32 %add, i32* %i, align 4
  %11 = load i32, i32* %0, align 4
  %12 = load i32, i32* %1, align 4
  %13 = load i32, i32* %2, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i64 0, i64 0), i32 %11, i32 %12, i32 %13)
  store i32 40, i32* %0, align 4
  store i32 60, i32* %1, align 4
  store i32 80, i32* %2, align 4
  %14 = load i32, i32* %0, align 4
  %15 = load i32, i32* %1, align 4
  %16 = load i32, i32* %2, align 4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 %14, i32 %15, i32 %16)
  br label %omp.body.continue

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %17 = load i32, i32* %.omp.iv, align 4
  %add3 = add nsw i32 %17, 1
  store i32 %add3, i32* %.omp.iv, align 4
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  call void @__kmpc_for_static_fini(%struct.ident_t* @0, i32 %4)
  ret void
}

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare dso_local void @__kmpc_for_static_fini(%struct.ident_t*, i32)

declare !callback !3 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...)

declare dso_local i32 @__tgt_target_teams(i64, i8*, i32, i8**, i8**, i64*, i64*, i32, i32)

; Function Attrs: noinline nounwind uwtable
define internal void @.omp_offloading.requires_reg() #4 section ".text.startup" {
entry:
  call void @__tgt_register_requires(i64 1)
  ret void
}

declare dso_local void @__tgt_register_requires(i64)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!omp_offload.info = !{!0}
!llvm.module.flags = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 0, i32 64768, i32 101864634, !"main", i32 14, i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!3 = !{!4}
!4 = !{i64 2, i64 -1, i64 -1, i1 true}

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
