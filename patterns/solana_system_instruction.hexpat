#pragma endian little

namespace Solana {
	enum SystemInstructionKind : u32 {
		CreateAccount = 0,
		Assign = 1,
		Transfer = 2,
		CreateAccountWithSeed = 3,
		AdvanceNonceAccount = 4,
		WithdrawNonceAccount = 5,
		InitializeNonceAccount = 6,
		AuthorizeNonceAccount = 7,
		Allocate = 8,
		AllocateWithSeed = 9,
		AssignWithSeed = 10,
		TransferWithSeed = 11,
		UpgradeNonceAccount = 12,
	};

	struct SystemInstruction {
		u32 kind;
		if (kind == SystemInstructionKind::CreateAccount) {
			u64 lamports;
			u64 space;
			u8 owner[32];
		} else if (kind == SystemInstructionKind::Assign) {
			u8 owner[32];
		} else if (kind == SystemInstructionKind::Transfer) {
			u64 lamports;
		} else if (kind == SystemInstructionKind::CreateAccountWithSeed) {
			u64 base;
			u64 seed_sz;
			u8 seed[seed_sz];
			u64 lamports;
			u64 space;
			u8 owner[32];
		} else if (kind == SystemInstructionKind::WithdrawNonceAccount) {
			u64 lamports;
		} else if (kind == SystemInstructionKind::InitializeNonceAccount) {
			u8 authorized[32];
		} else if (kind == SystemInstructionKind::AuthorizeNonceAccount) {
			u8 authorized[32];
		} else if (kind == SystemInstructionKind::Allocate) {
			u64 space;
		} else if (kind == SystemInstructionKind::AllocateWithSeed) {
			u8 base[32];
			u64 seed_sz;
			u8 seed[seed_sz];
			u64 space;
			u8 owner[32];
		} else if (kind == SystemInstructionKind::AssignWithSeed) {
			u8 base[32];
			u64 seed_sz;
			u8 seed[seed_sz];
			u8 owner[32];
		} else if (kind == SystemInstructionKind::TransferWithSeed) {
			u64 lamports;
			u64 from_seed_sz;
			u8 from_seed[from_seed_sz];
			u8 from_owner[32];
		}
	};
};
