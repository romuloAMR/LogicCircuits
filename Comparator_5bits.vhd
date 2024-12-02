LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Comparator_5bits IS
    PORT(
        A   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
        B   : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
        IE  : IN  STD_LOGIC;
        IL  : IN  STD_LOGIC;
        IG  : IN  STD_LOGIC;
        OE  : OUT STD_LOGIC;
        OL  : OUT STD_LOGIC;
        OG  : OUT STD_LOGIC
    );
END Comparator_5bits;

ARCHITECTURE Behavior OF Comparator_5bits IS
    SIGNAL IEQ, ILT, IGT : STD_LOGIC_VECTOR(4 DOWNTO 0);

    COMPONENT Full_comparator
        PORT(
            I    : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
            IEQ  : IN  STD_LOGIC;
            ILT  : IN  STD_LOGIC;
            IGT  : IN  STD_LOGIC;
            OEQ  : OUT STD_LOGIC;
            OLT  : OUT STD_LOGIC;
            OGT  : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN
    G0: Full_comparator PORT MAP (I => A(0) & B(0), IEQ => IE, ILT => IL, IGT => IG, OEQ => IEQ(0), OLT => ILT(0), OGT => IGT(0));
    G1: Full_comparator PORT MAP (I => A(1) & B(1), IEQ => IEQ(0), ILT => ILT(0), IGT => IGT(0), OEQ => IEQ(1), OLT => ILT(1), OGT => IGT(1));
    G2: Full_comparator PORT MAP (I => A(2) & B(2), IEQ => IEQ(1), ILT => ILT(1), IGT => IGT(1), OEQ => IEQ(2), OLT => ILT(2), OGT => IGT(2));
    G3: Full_comparator PORT MAP (I => A(3) & B(3), IEQ => IEQ(2), ILT => ILT(2), IGT => IGT(2), OEQ => IEQ(3), OLT => ILT(3), OGT => IGT(3));
    G4: Full_comparator PORT MAP (I => A(4) & B(4), IEQ => IEQ(3), ILT => ILT(3), IGT => IGT(3), OEQ => OE, OLT => OL, OGT => OG);
END Behavior;
