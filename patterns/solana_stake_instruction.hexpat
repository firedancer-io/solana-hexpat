#pragma endian little

namespace Solana {
	enum StakeInstructionKind : u32 {
		Initialize = 0,
		Authorize = 1,
		DelegateStake = 2,
		Split = 3,
		Withdraw = 4,
		Deactivate = 5,
		SetLockup = 6,
		Merge = 7,
		AuthorizeWithSeed = 8,
		InitializeChecked = 9,
		AuthorizeChecked = 10,
		AuthorizeCheckedWithSeed = 11,
		SetLockupChecked = 12,
	};

	struct Authorized {
		u8 staker[32];
		u8 withdrawer[32];
	};

	struct Lockup {
		s64 unix_timestamp;
		u64 epoch;
		u8 custodian[32];
	};

	enum StakeAuthorize : u32 {
		Staker = 0,
		Withdrawer = 1,
	};

	struct LockupArgs {
		u8 has_timestamp;
		if (has_timestamp)
			s64 unix_timestamp;
		u8 has_epoch;
		if (has_epoch)
			u64 epoch;
		u8 has_custodian;
		if (has_custodian)
			u8 custodian[32];
	};

	struct AuthorizeWithSeedArgs {
		u8 new_authorized_pubkey[32];
		StakeAuthorize stake_authorize;
		u8 authority_seed[32];
		u8 authority_owner[32];
	};

	struct AuthorizeCheckedWithSeedArgs {
		StakeAuthorize stake_authorize;
		u8 authority_seed[32];
		u8 authority_owner[32];
	};

	struct LockupCheckedArgs {
		u8 has_unix_timestamp;
		if (has_unix_timestamp)
			s64 unix_timestamp;
		u8 has_epoch;
		if (has_epoch)
			u64 epoch;
	};

	struct StakeInstruction {
		u32 kind;
		if (kind == StakeInstructionKind::Initialize) {
			Authorized authorized;
			Lockup lockup;
		} else if (kind == StakeInstructionKind::Authorize) {
			u8 pubkey[32];
			StakeAuthorize stake_authorize;
		} else if (kind == StakeInstructionKind::Split) {
			u64 lamports;
		} else if (kind == StakeInstructionKind::Withdraw) {
			u64 lamports;
		} else if (kind == StakeInstructionKind::SetLockup) {
			LockupArgs lockup_args;
		} else if (kind == StakeInstructionKind::AuthorizeWithSeed) {
			AuthorizeWithSeedArgs args;
		} else if (kind == StakeInstructionKind::AuthorizeChecked) {
			StakeAuthorize stake_authorize;
		} else if (kind == StakeInstructionKind::AuthorizeCheckedWithSeed) {
			AuthorizeCheckedWithSeedArgs args;
		} else if (kind == StakeInstructionKind::SetLockupChecked) {
			LockupCheckedArgs args;
		}
	};
};
