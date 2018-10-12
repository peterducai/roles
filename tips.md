Use sepolicy from the policycoreutils-devel package on your RedHat distribution. To achieve what you asked you will need to use the following:

  sepolicy generate --confined_admin -n NAME [-a ADMIN_DOMAIN] [-u  USER]

This will generate a policy which you can compile (make -f /usr/share/selinux/devel/Makefile) into a module that you can install with semodule -i, but please check the resulting .te file first and adjust it as it fits you. Please also note that the generator insert the permissive domain into the policy by default. Therefore, once you are happy with the created policy -- you need to remove the permissive domain, recompile the policy with make -f /usr/share/selinux/devel/Makefile and off you go :)

