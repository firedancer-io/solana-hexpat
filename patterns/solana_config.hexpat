#pragma endian little

namespace Solana {
	struct ConfigKey {
		u8 pubkey[32];
		u8 is_signer;
	};

	struct ConfigKeys {
		u16 key_cnt;
		ConfigKey keys[32];
	};
};
