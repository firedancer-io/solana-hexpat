# solana-hexpat

This repository defines [hexpat] definitions for Solana internal data structures.
These are most commonly used with the [ImHex] hex editor.

  [hexpat]: https://docs.werwolv.net/pattern-language/
  [ImHex]:  https://github.com/WerWolv/ImHex

![Vote Account parsed with ImHex](./.github/vote_account.png)

## Usage

1. Open [ImHex](https://github.com/WerWolv/ImHex)
2. Open a binary blob (such as the contents of an account)
3. Paste the appropriate pattern definition into the *Pattern Editor*
4. Click play

## Implemented Features

- Solana Config Program
  - [solana_config.hexpat](./patterns/solana_config.hexpat)
- Solana Stake Program
  - [solana_stake_instruction.hexpat](./patterns/solana_stake_instruction.hexpat)
- Solana System Program
  - [solana_system_instruction.hexpat](./patterns/solana_system_instruction.hexpat)
- Solana Vote Program
  - [solana_vote_account.hexpat](./patterns/solana_vote_account.hexpat)
  - [solana_vote_instruction.hexpat](./patterns/solana_vote_instruction.hexpat)

## Attributions

Thank you to [@WerWolv](https://github.com/WerWolv/ImHex) for creating the ImHex toolchain.
Shoutout to [@CherryWorm](https://github.com/CherryWorm) at Neodyme for the idea of using ImHex for Solana debugging.
