gs = GrouperSession.startRootSession();

addGroup("app:mfa", "mfa_required", "mfa_required");
addGroup("app:mfa:ref", "mfa_opt_in", "mfa_opt_in");
addMember("app:mfa:mfa_enabled_allow", "app:mfa:ref:mfa_opt_in");

addStem("app:mfa", "etc", "etc")
addGroup("app:mfa:etc", "mfa_opt_in_access", "mfa_opt_in_access");
addGroup("app:mfa:etc", "mfa_opt_in_access_allow", "mfa_opt_in_access_allow");
addGroup("app:mfa:etc", "mfa_opt_in_access_deny", "mfa_opt_in_access_deny");

addComposite("app:mfa:etc:mfa_opt_in_access", CompositeType.COMPLEMENT, "app:mfa:etc:mfa_opt_in_access_allow", "app:mfa:etc:mfa_opt_in_access_deny");

addMember("app:mfa:etc:mfa_opt_in_access_allow", "ref:faculty");
addMember("app:mfa:etc:mfa_opt_in_access_allow", "ref:staff");
addMember("app:mfa:etc:mfa_opt_in_access_allow", "ref:student");

addMember("app:mfa:etc:mfa_opt_in_access_deny", "app:mfa:mfa_required");

grantPriv("app:mfa:ref:mfa_opt_in", "app:mfa:etc:mfa_opt_in_access", AccessPrivilege.OPTIN);
grantPriv("app:mfa:ref:mfa_opt_in", "app:mfa:etc:mfa_opt_in_access", AccessPrivilege.OPTOUT);
