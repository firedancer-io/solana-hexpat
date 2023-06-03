solana_vote_program test data
=============================

Instruction Data
----------------

The `instruction` subdirectory contains test cases for the `solana_vote_account.hexpat` pattern.

| prefix   | name                             | solana_vote_program::VoteInstruction |
|:---------|----------------------------------|--------------------------------------|
| 00000000 | initialize_account.bin           | InitializeAccount                    |
| 00000001 | authorize_voter.bin              | Authorize(_, Voter)                  |
| 00000002 | vote.bin                         | Vote                                 |
| 00000003 | withdraw.bin                     | Withdraw                             |
| 00000004 | update_validator_identity.bin    | UpdateValidatorIdentity              |
| 00000005 | update_commission.bin            | UpdateCommission                     |
| 00000006 | vote_switch.bin                  | VoteSwitch                           |
| 00000007 | authorize_checked_voter.bin      | AuthorizeChecked(Voter)              |
| 00000007 | authorize_checked_withdrawer.bin | AuthorizeChecked(Withdrawer)         |
| 00000008 | update_vote_state.bin            | UpdateVoteState                      |
| 00000009 | update_vote_state_switch.bin     | UpdateVoteStateSwitch                |
| 0000000a | authorize_with_seed.bin          | AuthorizeWithSeed                    |
| 0000000b | authorize_checked_with_seed.bin  | AuthorizeCheckedWithSeed             |

Changelog
---------


- 2023-06-02: Test data collected from Solana Labs v1.14
