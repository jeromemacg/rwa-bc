# RWAOS

## Real World Assets on the Blockchain

### RWAOS tokenized property model on Solana

As Real World Assets (RWAs) continue gaining momentum in crypto, the infrastructure to
support them remains fragmented and inefficient. Traditional blockchains struggle to provide the
compliance, performance, and transparency needed to bring RWAs fully on-chain.
RWAOS is the first RWA-optimized Layer 2 built on Solana, purpose-built to tokenize,
manage, and transact real-world value with speed and compliance.

### Solana Architecture

Background summary of the Architecture 

1. Each property = 1 SPL token
2. Track Ownership + Whitelisting via PDAs (KYC and metadata)
   1. Each investor gets an associated token account 
   2. KYC whitelisting enforced with on-chain flags
3. IF property is rentable/rented - Rent Distribution in SOL
   1. Collect rent into a central treasury wallet
   2. dapp - holders’ token balances & proportional shares 
   3. on-chain Anchor program OR off-chain triggers
4. Governance 
   1. Realms OR Anchor-based DAO - Token holders to vote on:
      1. Sale decisions 
      2. Repairs & Property Management issues
      3. Portfolio updates & strategy
      4. Investment decisions
      5. KYC & Compliance
      6. Chain issues: validators, oracles, protocol upgrades
      7. Token emission & rewards
5. KYC/Compliance (options TBC)
   1. Token gating + allow-listing wallets off-chain 
   2. Store KYC status in a metadata account
   3. New ideas - Digital Twins/Proof of Reality

### Tech Stack

Smart Contracts using Anchor 
Frontend UI Next.js, Tailwind, Wallet Adapters 
Token UI Solana SPL, Token SDK 
Rental Management Node.js, @solana/web3.js
Governance Realms (SPL DAO) or custom Anchor logic
Hosting	Vercel + Firebase/Hasura for metadata
KYC	Civic Pass, Fractal ID, or off-chain checks

## Set Up for Testing

In progress - will add here all steps required to test associated dapps and programs

KEEP ON BUILDING...






