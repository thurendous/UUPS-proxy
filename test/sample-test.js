const { expect, assert } = require("chai");
const { ethers, upgrades } = require("hardhat");

describe("ERC20", function () {
  before("get factories", async function () {
    this.Mars = await hre.ethers.getContractFactory("Mars");
    this.MarsV2 = await hre.ethers.getContractFactory("MarsV2");
    this.MarsV3 = await hre.ethers.getContractFactory("MarsV3");
  });

  it("goes to mars", async function () {
    const mars = await upgrades.deployProxy(this.Mars, { kind: "uups" });

    assert((await mars.name()) === "Mars");

    const marsv2 = await upgrades.upgradeProxy(mars, this.MarsV2);

    const marsv3 = await upgrades.upgradeProxy(mars, this.MarsV3);

    assert((await marsv3.version()) === "This is v3");
  });
});
