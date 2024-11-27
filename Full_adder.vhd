LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Full_adder IS
    PORT(
        I    : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        Cin  : IN  STD_LOGIC;
        Cout : OUT STD_LOGIC;
        O    : OUT STD_LOGIC
    );
END Full_adder;

ARCHITECTURE Behavior OF Full_adder IS
BEGIN
    Cout <= (I(0) AND I(1)) OR (I(0) AND Cin) OR (I(1) AND Cin);
    O <= I(0) XOR I(1) XOR Cin;
END Behavior;