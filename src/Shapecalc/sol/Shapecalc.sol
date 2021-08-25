pragma solidity ^0.4.0;

/// @title Shape Calculator = Shape Calc = Shapecalc

// Declare the smart contract
contract shapeCalc {

  /** @dev When does the surface area of a rectangle equal its perimeter value?
      Answer: When the rectangle mirrors the common shape of a square. */

  // Establish the parameters for the dimensions of the shape rectangle

  /// @param w; where the unsigned integer `w` = the width of a rectangle
  /// @param h; where the unsigned integer `h` = the height of a rectangle
  /// @param s; where the unsigned integer `s` = the surface area of a rectangle
  /// @param p; where the unsigned integer `p` = the perimeter of a rectangle

  // Declare the function rectangle
  function rectangle(uint w, unit h) returns (uint s, uint p) {
    s = w * h;
    p = 2 * (w + h);
  }
}
