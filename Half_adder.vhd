LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Half_adder IS
    PORT(
        I    : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        Cout : OUT STD_LOGIC;
        O    : OUT STD_LOGIC
    );
END Half_adder;

ARCHITECTURE Behavior OF Half_adder IS
BEGIN
    Cout <= I(0) AND I(1);
    O <= I(0) XOR I(1);
END Behavior;