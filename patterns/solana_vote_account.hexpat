#pragma endian little

namespace Solana {
	struct VoteLockout {
		u64 slot;
		u32 confirmation_count;
	};

	struct AuthorizedVoter {
		u64 epoch;
		u8 pubkey[32];
	};

	struct PriorVoter {
		u8 pubkey[32];
		u64 credits;
		u64 prev_credits;
	};

	struct PriorVoters {
		PriorVoter buf[32];
		u64 idx;
		u8 is_empty;
	};

	struct EpochCredits {
		u64 epoch;
		u64 credits;
		u64 prev_credits;
	};

	struct VoteStateCurrent {
		u8 node_pubkey[32];
		u8 authorized_withdrawer[32];
		u8 commission;
		u64 vote_cnt;
		VoteLockout votes[vote_cnt];
		u8 has_root_slot;
		if(has_root_slot)
			le u64 root_slot;
		u64 authorized_voter_cnt;
		AuthorizedVoter authorized_voter[authorized_voter_cnt];
		PriorVoters prior_voters;
		u64 epoch_credits_cnt;
		EpochCredits epoch_credits[epoch_credits_cnt];
		u64 last_timestamp;
	};

	struct VoteState {
		u32 version;
		if (version != 0) {
			VoteStateCurrent current;
		}
	};
}

Solana::VoteState account @ 0x00;
