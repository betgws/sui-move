/*
/// Module: nft_mint
module nft_mint::nft_mint;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


// File: sources/NftContract.move
module NftProject::NftProject;
use std::string;

use sui::object::{ UID};
use sui::transfer;
use sui::object;


    /// NFT 구조체 정의
    public struct Nft has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        image_url: string::String,
    }

    /// NFT를 발행하는 함수
    public entry fun mint(
        name: vector<u8>,
        description: vector<u8>,
        image_url: vector<u8>,
        ctx: &mut TxContext 
    ) {
        let nft = Nft {
            id: object::new(ctx),                             // UID 생성
            name: string::utf8(name),
            description: string::utf8(description),
            image_url: string::utf8(image_url),
        };
        transfer::transfer(nft, tx_context::sender(ctx));
    }
