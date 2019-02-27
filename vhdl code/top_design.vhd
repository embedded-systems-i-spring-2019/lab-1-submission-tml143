------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity top_design is
    Port ( btn : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           sw : in STD_LOGIC_vector(3 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end top_design;

architecture Behavioral of top_design is
component fancy_counter
port(
clk : in STD_LOGIC;
clk_en : in std_logic;
dir : in STD_LOGIC;
en : in STD_LOGIC;
ld : in STD_LOGIC;
rst : in STD_LOGIC;
updn : in STD_LOGIC;
val : in STD_LOGIC_VECTOR (3 downto 0);
cnt : out STD_LOGIC_VECTOR (3 downto 0)
);
end component;

component debounce
port(
BTN : in STD_LOGIC;
CLK : in STD_LOGIC;
DBNC : out STD_LOGIC
);
end component;

component clock_div
port(
clk  : in std_logic;        
new_clock : out std_logic
);
end component;

signal s_rst, s_en, s_updn, s_ld, s_clk_en, s_dir : std_logic;

begin

debounce0: debounce
port map(
BTN => btn(0),
clk => clk,
dbnc => s_rst
);
debounce1: debounce
port map(
BTN => btn(1),
clk => clk,
dbnc => s_en
);
debounce2: debounce
port map(
BTN => btn(2),
clk => clk,
dbnc => s_updn
);
debounce3: debounce
port map(
BTN => btn(3),
clk => clk,
dbnc => s_ld
);
clock_divider: clock_div
Port map(
clk => clk,
new_clock => s_clk_en
);
fancy_sscounter: fancy_counter
port map(
clk => clk,
clk_en => s_clk_en,
dir => sw(0),
en => s_en,
ld => s_ld,
rst => s_rst,
updn =>s_updn,
val => sw,
cnt => led

);

end Behavioral;
