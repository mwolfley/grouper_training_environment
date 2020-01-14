gs = GrouperSession.startRootSession();

addStem("app", "mfa", "mfa");
addGroup("app:mfa", "mfa_enabled", "mfa_enabled");
addGroup("app:mfa", "mfa_enabled_allow", "mfa_enabled_allow");
addGroup("app:mfa", "mfa_enabled_deny", "mf_enabled_deny");
addComposite("app:mfa:mfa_enabled", CompositeType.COMPLEMENT, "app:mfa:mfa_enabled_allow", "app:mfa:mfa_enabled_deny");

addStem("app:mfa", "ref", "ref");
addGroup("app:mfa:ref", "pilot", "pilot");

addMember("app:mfa:mfa_enabled_allow", "app:mfa:ref:pilot");
