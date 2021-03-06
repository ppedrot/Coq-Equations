module PathOT :
  sig
    type t = Covering.path
    val compare : Evar.t list -> Evar.t list -> int
  end
module PathMap : CSig.MapS with type key = PathOT.t

type where_map = (Term.constr * Names.Id.t * Covering.splitting) Evar.Map.t

type equations_info = {
 equations_id : Names.Id.t;
 equations_where_map : where_map;
 equations_f : Constr.t;
 equations_prob : Covering.context_map;
 equations_split : Covering.splitting }

type ind_info = {
 term_info : Splitting.term_info;
 pathmap : (Names.Id.t * Constr.t list) PathMap.t; (* path -> inductive name + parameters (de Bruijn) *)
 wheremap : where_map;
}

val find_helper_info :
  Splitting.term_info ->
  Term.constr -> Term.existential_key * int * Names.identifier
val below_transparent_state : unit -> Names.transparent_state
val simpl_star : Proof_type.tactic
val eauto_with_below :
  ?depth:Int.t -> Hints.hint_db_name list -> Proofview.V82.tac
val wf_obligations_base : Splitting.term_info -> string
val simp_eqns : Hints.hint_db_name list -> Proof_type.tactic
val simp_eqns_in :
  Locus.clause -> Hints.hint_db_name list -> Proof_type.tactic
val autorewrites : string -> Proof_type.tactic
val autorewrite_one : string -> Proofview.V82.tac

(** The multigoal fix tactic *)
val mutual_fix : string list -> int list -> unit Proofview.tactic

val find_helper_arg :
  Splitting.term_info -> Term.constr -> 'a array -> Term.existential_key * int * 'a
val find_splitting_var :
  Covering.pat list -> int -> Term.constr list -> Names.Id.t
val intros_reducing : Proof_type.tactic
val cstrtac : 'a -> Proof_type.tactic
val destSplit : Covering.splitting -> Covering.splitting option array option
val destRefined : Covering.splitting -> Covering.splitting option
val destWheres : Covering.splitting -> Covering.where_clause list option
val map_opt_split : ('a -> 'b option) -> 'a option -> 'b option
val solve_ind_rec_tac : Splitting.term_info -> unit Proofview.tactic
val aux_ind_fun :
  ind_info ->
  int * int ->
  Covering.splitting option ->
  Names.Id.t list -> Covering.splitting -> Proof_type.tactic
val ind_fun_tac :
  Syntax.rec_type option ->
  Term.constr ->
  ind_info ->
  Names.Id.t ->
  Covering.splitting -> Covering.splitting option ->
  (Splitting.program_info * Splitting.compiled_program_info * equations_info) list ->
  unit Proofview.tactic

val prove_unfolding_lemma :
  Splitting.term_info ->
  where_map ->
  Syntax.logical_rec ->
  Names.constant ->
  Names.constant ->
  Covering.splitting -> Covering.splitting ->
  Proof_type.goal Evd.sigma ->
  Proof_type.goal list Evd.sigma
  
val ind_elim_tac :
  Term.constr ->
  int ->
  int ->
  Splitting.term_info ->
  Globnames.global_reference ->
  unit Proofview.tactic
