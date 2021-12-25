const { expect, assert } = require("chai");
const { ethers } = require("hardhat");

describe("ERC20", function () {
  before("get factories", async function () {
    this.Mars = await hre.ethers.getContractFactory("Mars");
  });

  it("goes to mars", async function () {
    const mars = await upgrades.deployProxy(this.Mars, { kind: "uups" });

    assert((await mars.name()) === "Mars");
  });
});
