const { expect } = require('chai');
let contract;

before (async () => {
    contract = await (await ethers.getContractFactory("Set")).deploy();
    await contract.deployed();
});

describe('Set', async () => {

    it('Get correct value in the set set with the given address', async () => {
        await contract.insert('0x5B38Da6a701c568545dCfcB03FcB875f56beddC4', '1000');
        expect(await contract.get('0x5B38Da6a701c568545dCfcB03FcB875f56beddC4')).to.equal('1000');
    });

    it('Get correct length of set', async () => {
        expect(await contract.len()).to.equal('1');

        await contract.insert('0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2', '36549');
        expect(await contract.len()).to.equal('2');

        await contract.insert('0x617F2E2fD72FD9D5503197092aC168c91465E7f2', '1');
        expect(await contract.len()).to.equal('3');
    });
    
    it('Should insert an element in the set', async () => {
        await expect(contract.insert('0x583031D1113aD414F02576BD6afaBfb302140225', '30')).to.emit(contract, 'Log');
        expect(await contract.set('0x583031D1113aD414F02576BD6afaBfb302140225')).to.equal('30');
    });

    it('Should remove an element in the set', async () => {
        await expect(contract.remove('0x583031D1113aD414F02576BD6afaBfb302140225')).to.emit(contract, 'Log');
    });

    it('Should be reverted with "Already exist"', async () => {
        await expect(contract.insert('0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2', '50')).to.be.revertedWith('Already exist');
    });

    it('Should be reverted with "Does not exist"', async () => {
        await expect(contract.remove('0xdD870fA1b7C4700F2BD7f44238821C26f7392148')).to.be.revertedWith('Does not exist');
    });
});