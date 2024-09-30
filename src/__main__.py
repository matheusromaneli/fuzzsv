"""Start aplication."""

import c_package.sv_publisher as sv_pub

sv = sv_pub.SVPublisher_create(None, "eth0")

print(sv)
