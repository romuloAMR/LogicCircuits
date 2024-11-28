LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY AddSub_8bits IS
    PORT(
        A        : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        B        : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        Ctrl     : IN  STD_LOGIC;
        Overflow : OUT STD_LOGIC;
        S        : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END AddSub_8bits;

ARCHITECTURE Behavior OF AddSub_8bits IS
    COMPONENT Full_adder
        PORT(
            I    : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
            Cin  : IN  STD_LOGIC;
            Cout : OUT STD_LOGIC;
            O    : OUT STD_LOGIC
        );
    END COMPONENT;
    
    SIGNAL Cin   : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL C     : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL B_xor_Ctrl : STD_LOGIC_VECTOR(7 DOWNTO 0);
    
BEGIN
    B_xor_Ctrl <= B XOR (Ctrl & Ctrl & Ctrl & Ctrl & Ctrl & Ctrl & Ctrl & Ctrl);
    U0: Full_adder PORT MAP (
        I    => A(0) & B_xor_Ctrl(0),
        Cin  => Ctrl,
        Cout => C(0),
        O    => S(0)
    );
    GEN_FA: FOR i IN 1 TO 7 GENERATE
        U: Full_adder PORT MAP (
            I    => A(i) & B_xor_Ctrl(i),
            Cin  => C(i-1),
            Cout => C(i),
            O    => S(i)
        );
    END GENERATE;
    Overflow <= C(6) XOR C(7);
END Behavior;
