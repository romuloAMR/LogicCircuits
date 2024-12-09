LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ALU_16bit IS
    PORT(
		A        : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		B        : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
      M        : IN  STD_LOGIC;
      S0       : IN  STD_LOGIC;
      S1       : IN  STD_LOGIC;
      Serial   : IN  STD_LOGIC;
      Output   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		Carry    : OUT STD_LOGIC;
		Overflow : OUT STD_LOGIC
    );
END ALU_16bit;

ARCHITECTURE Structural OF ALU_16bit IS

COMPONENT Shift_16bit
PORT(
	Input    : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
   Serial   : IN STD_LOGIC;
   ShiftR   : IN STD_LOGIC;
   ShiftL   : IN STD_LOGIC;
   Output   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END COMPONENT;

COMPONENT D0_ALU
PORT(
	M         : IN  STD_LOGIC;
   S0        : IN  STD_LOGIC;
   S1        : IN  STD_LOGIC;
   OLeft     : OUT STD_LOGIC;
   ORight    : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT AE_ALU
PORT(
	B  : IN  STD_LOGIC;
   M  : IN  STD_LOGIC;
   S0 : IN  STD_LOGIC;
   S1 : IN  STD_LOGIC;
   O  : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT LE_ALU
PORT(
	A  : IN  STD_LOGIC;
   B  : IN  STD_LOGIC;
   M  : IN  STD_LOGIC;
   S0 : IN  STD_LOGIC;
   S1 : IN  STD_LOGIC;
   O  : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT D1_ALU
PORT(
	M  : IN  STD_LOGIC;
   S0 : IN  STD_LOGIC;
   S1 : IN  STD_LOGIC;
   O  : OUT STD_LOGIC
);
END COMPONENT;

COMPONENT Full_adder
PORT(
	I    : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
   Cin  : IN  STD_LOGIC;
   Cout : OUT STD_LOGIC;
   O    : OUT STD_LOGIC
);
END COMPONENT;
SIGNAL R, L, C0     : STD_LOGIC;
SIGNAL S, IA, IB, F : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL C            : STD_LOGIC_VECTOR(16 DOWNTO 0);

BEGIN
	D0: D0_ALU PORT MAP (
      M      => M,
		S0     => S0,
		S1     => S1,
		OLeft  => L,
		ORight => R
   );
	SHIFT: Shift_16bit PORT MAP (
        Input => A,
		  Serial => Serial,
		  ShiftR => R,
		  ShiftL => L,
		  Output => S  
   );
	GEN_I: FOR i IN 15 DOWNTO 0 GENERATE
		AE_i: AE_ALU PORT MAP (
			B  => B(i),
			M  => M,
			S0 => S0,
			S1 => S1,
			O  => IB(i)
		);
	END GENERATE GEN_I;
	GEN_II: FOR i IN 15 DOWNTO 0 GENERATE
		LE_i: LE_ALU PORT MAP (
			A  => S(i),
			B  => B(i),
			M  => M,
			S0 => S0,
			S1 => S1,
			O  => IA(i)
		);
	END GENERATE GEN_II;
	D1: D1_ALU PORT MAP (
		M  => M,
		S0 => S0,
		S1 => S1,
		O  => C0
	);

	C(0) <= C0;
	GEN_III: FOR i IN 15 DOWNTO 0 GENERATE
		FA_i: Full_adder PORT MAP (
			I     => (IA(i), IB(i)),
			Cin   => C(i),
			Cout  => C(i+1),
			O     => F(i)
		);
	END GENERATE GEN_III;
	Carry <= C(16);
	Overflow <= c(16) XOR C(15);
	Output <= F;
END Structural;