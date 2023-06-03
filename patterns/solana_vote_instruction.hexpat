#pragma endian little

struct RustString {
	u64 len;
	u8 data[len];
};

namespace Solana {
	enum VoteInstructionKind : u32 {
		InitializeAccount = 0,
		Authorize = 1,
		Vote = 2,
		Withdraw = 3,
		UpdateValidatorIdentity = 4,
		UpdateCommission = 5,
		VoteSwitch = 6,
		AuthorizeChecked = 7,
		UpdateVoteState = 8,
		UpdateVoteStateSwitch = 9,
		AuthorizeWithSeed = 10,
		AuthorizeCheckedWithSeed = 11,
	};

	enum VoteAuthorize : u32 {
		Voter = 0,
		Withdrawer = 1,
	};

	struct VoteInit {
		u8 node_pubkey[32];
		u8 authorized_voter[32];
		u8 authorized_withdrawer[32];
		u8 commission;
	};

	struct Vote {
		u64 slot_cnt;
		u64 slots[slot_cnt];
		u8 hash[32];
		u8 has_timestamp;
		if (has_timestamp)
			s64 timestamp;
	};

	struct Lockout {
		u64 slot;
		u32 confirmation_count;
	};

	struct VoteStateUpdate {
		u64 lockout_cnt;
		Lockout lockouts[lockout_cnt];
		u8 has_root;
		if (has_root)
			u64 root_slot;
		u8 hash[32];
		u8 has_timestamp;
		if (has_timestamp)
			s64 timestamp;
	};

	struct VoteAuthorizeWithSeedArgs {
		VoteAuthorize authorization_type;
		u8 current_authority_derived_key_owner[32];
		RustString current_authority_derived_key_seed;
		u8 new_authority[32];
	};

	struct VoteAuthorizeCheckedWithSeedArgs {
		VoteAuthorize authorization_type;
		u8 current_authority_derived_key_owner[32];
		RustString current_authority_derived_key_seed;
	};

	struct VoteInstruction {
		u32 kind;
		if (kind == VoteInstructionKind::InitializeAccount) {
			VoteInit vote_init;
		} else if (kind == VoteInstructionKind::Authorize) {
			u8 vote_account_address[32];
			VoteAuthorize vote_authorize;
		} else if (kind == VoteInstructionKind::Vote) {
			Vote vote;
		} else if (kind == VoteInstructionKind::Withdraw) {
			u64 withdraw;
		} else if (kind == VoteInstructionKind::UpdateCommission) {
			u8 commission;
		} else if (kind == VoteInstructionKind::VoteSwitch) {
			Vote vote;
			u8 hash[32];
		} else if (kind == VoteInstructionKind::AuthorizeChecked) {
			VoteAuthorize vote_authorize;
		} else if (kind == VoteInstructionKind::UpdateVoteState) {
			VoteStateUpdate vote_state_update;
		} else if (kind == VoteInstructionKind::UpdateVoteStateSwitch) {
			VoteStateUpdate vote_state_update;
			u8 hash[32];
		} else if (kind == VoteInstructionKind::AuthorizeWithSeed) {
			VoteAuthorizeWithSeedArgs vote_authorize_with_seed_args;
		} else if (kind == VoteInstructionKind::AuthorizeCheckedWithSeed) {
			VoteAuthorizeCheckedWithSeedArgs vote_authorize_checked_with_seed_args;
		}
	};
}

Solana::VoteInstruction instruction @ 0x00;
