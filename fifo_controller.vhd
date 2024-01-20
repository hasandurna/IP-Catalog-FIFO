library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity fifo_controller is
 Port ( 
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        full : OUT STD_LOGIC;
        wr_ack : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        valid : OUT STD_LOGIC;
        data_count : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        wr_rst_busy : OUT STD_LOGIC;
        rd_rst_busy : OUT STD_LOGIC
 );
end fifo_controller;

architecture Behavioral of fifo_controller is


component fifo_generator_0 IS
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    wr_ack : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    valid : OUT STD_LOGIC;
    data_count : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
  );
END component;

begin

fifo_ip: fifo_generator_0 port map
(
    clk           => clk          ,
    rst           => rst          ,
    din           => din          ,
    wr_en         => wr_en        ,
    rd_en         => rd_en        ,
    dout          => dout         ,
    full          => full         ,
    wr_ack        => wr_ack       ,
    empty         => empty        ,
    valid         => valid        ,
    data_count    => data_count   ,
    wr_rst_busy   => wr_rst_busy  ,
    rd_rst_busy   => rd_rst_busy  
);

end Behavioral;
