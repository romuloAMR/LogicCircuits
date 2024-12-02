LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Full_comparator IS
    PORT(
        I    : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        IEQ  : IN  STD_LOGIC;
        ILT  : IN  STD_LOGIC;
        IGT  : IN  STD_LOGIC;
        OEQ  : OUT STD_LOGIC;
        OLT  : OUT STD_LOGIC;
        OGT  : OUT STD_LOGIC
    );
END Full_comparator;

ARCHITECTURE Behavior OF Full_comparator IS
BEGIN
    OEQ <= IEQ AND (NOT (I(0) XOR I(1)));
    OLT <= ILT OR (IEQ AND ((NOT I(0)) AND I(1)));
    OGT <= IGT OR (IEQ AND (I(0) AND (NOT I(1))));
END Behavior;