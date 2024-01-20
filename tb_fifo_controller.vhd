library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity tb_fifo_controller is
--  Port ( );
end tb_fifo_controller;

architecture Behavioral of tb_fifo_controller is

component fifo_controller is
port (
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
    sbiterr : OUT STD_LOGIC;
    dbiterr : OUT STD_LOGIC;
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
);
end component;

signal        clk     : STD_LOGIC;                              
signal        rst     : STD_LOGIC;                              
signal        din     : STD_LOGIC_VECTOR(7 DOWNTO 0);           
signal        wr_en   : STD_LOGIC;                            
signal        rd_en   : STD_LOGIC;                            
signal        dout    : STD_LOGIC_VECTOR(7 DOWNTO 0);         
signal        full    : STD_LOGIC;                            
signal        wr_ack  : STD_LOGIC;                          
signal        empty   : STD_LOGIC;                           
signal        valid   : STD_LOGIC;                           
signal        data_count : STD_LOGIC_VECTOR(7 DOWNTO 0);   
signal        sbiterr : STD_LOGIC;                         
signal        dbiterr :  STD_LOGIC;                         
signal        wr_rst_busy :  STD_LOGIC;                     
signal        rd_rst_busy :  STD_LOGIC  ;                    

constant clock_period : time := 20 ns;

begin

clock_process: process
 begin
    clk <= '0' ;
    wait for clock_period/2 ;
    clk <= '1' ;
    wait for clock_period/2 ;
   end process;

--

fifo_ip : fifo_controller port map
(
clk            =>   clk        ,  
rst            =>    rst        , 
din            =>   din        ,  
wr_en          =>   wr_en     ,   
rd_en          =>   rd_en      ,  
dout           =>    dout      ,  
full           =>   full       ,  
wr_ack         =>   wr_ack     ,  
empty          =>   empty      ,  
valid          =>   valid     ,   
data_count     =>   data_count ,  
sbiterr        =>   sbiterr    ,  
dbiterr        =>   dbiterr    ,  
wr_rst_busy    =>   wr_rst_busy,  
rd_rst_busy    =>   rd_rst_busy   
                                  
);                                

stim_proc : process
begin
rst <= '1';         -- reset durumundan baslamali test bench
wait for 210 ns;
rst <= '0';
wait for clock_period;

wait for 300 ns;           -- dokumanda bu kadar sure beklemek gerektigi belirtilmis

--1
wr_en   <= '1';             -- artik yazabiliriz
din     <= x"0a";
wait for clock_period;      -- bir clock sonra yazma tamamlanmis olur

--2
din     <= x"0b";
wait for clock_period;

--3
din     <= x"0c";
wait for clock_period;

--4
din     <= x"0d";
wait for clock_period;

--5
din     <= x"0e";
wait for clock_period;

--6
din     <= x"0f";
wait for clock_period;

--7
din     <= x"aa";
wait for clock_period;

--8
din     <= x"ab";
wait for clock_period;

--9
din     <= x"ac";
wait for clock_period;

--10
din     <= x"ad";
wait for clock_period;

--11
din     <= x"ae";
wait for clock_period;

--12
din     <= x"af";
wait for clock_period;

--13
din     <= x"ff";
wait for clock_period;

wr_en   <= '0';             -- yazma islemi bitti
wait for clock_period;

rd_en <= '1';               -- okuma islemi basladi
wait for clock_period*44;   -- 30 tane okuma yapalim istedik
rd_en <= '0';

wait;

end process;
end Behavioral;








