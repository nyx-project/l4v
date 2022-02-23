(*
 * Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
 *
 * SPDX-License-Identifier: GPL-2.0-only
 *)

(* FIXME AARCH64: verbatim setup copy of RISCV64; needs adjustment and validation;
                  only minimal type-check changes performed so far if any *)

chapter \<open>Architecture-specific Fault-handling Functions\<close>

theory ArchFault_A
imports Structures_A Tcb_A
begin

context Arch begin global_naming RISCV64_A

fun make_arch_fault_msg :: "arch_fault \<Rightarrow> obj_ref \<Rightarrow> (data \<times> data list,'z::state_ext) s_monad"
  where
  "make_arch_fault_msg (VMFault vptr archData) thread = do
     pc \<leftarrow> as_user thread getRestartPC;
     return (5, pc # vptr # archData)
   od"

definition handle_arch_fault_reply ::
  "arch_fault \<Rightarrow> obj_ref \<Rightarrow> data \<Rightarrow> data list \<Rightarrow> (bool,'z::state_ext) s_monad"
  where
  "handle_arch_fault_reply vmf thread x y \<equiv> return True"

end
end