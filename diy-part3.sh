diff --git a/target/linux/sunxi/patches-5.4/102-arm64-dts-allwinner-h6-Enable-CPU-opp-tables-for-orangepi.patch b/target/linux/sunxi/patches-5.4/102-arm64-dts-allwinner-h6-Enable-CPU-opp-tables-for-orangepi.patch
new file mode 100644
index 000000000..2e4f3ea4e
--- /dev/null
+++ b/target/linux/sunxi/patches-5.4/102-arm64-dts-allwinner-h6-Enable-CPU-opp-tables-for-orangepi.patch
@@ -0,0 +1,38 @@
+--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
++++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+@@ -7,6 +7,7 @@
+ /dts-v1/;
+ 
+ #include "sun50i-h6.dtsi"
++#include "sun50i-h6-cpu-opp.dtsi"
+ 
+ #include <dt-bindings/gpio/gpio.h>
+ 
+@@ -47,6 +48,10 @@
+ 	};
+ };
+ 
++&cpu0 {
++	cpu-supply = <&reg_dcdca>;
++};
++
+ &ehci0 {
+ 	status = "okay";
+ };
+@@ -158,13 +163,15 @@
+ 			reg_dcdca: dcdca {
+ 				regulator-always-on;
+ 				regulator-min-microvolt = <810000>;
+-				regulator-max-microvolt = <1080000>;
++				regulator-max-microvolt = <1160000>;
++				regulator-ramp-delay = <2500>;
+ 				regulator-name = "vdd-cpu";
+ 			};
+ 
+ 			reg_dcdcc: dcdcc {
+ 				regulator-min-microvolt = <810000>;
+ 				regulator-max-microvolt = <1080000>;
++				regulator-ramp-delay = <2500>;
+ 				regulator-name = "vdd-gpu";
+ 			};
+