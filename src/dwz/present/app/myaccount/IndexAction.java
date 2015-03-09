package dwz.present.app.myaccount;

import dwz.framework.constants.user.UserType;
import dwz.present.BaseAction;

public class IndexAction extends BaseAction {
	
	public String index() {
		if (UserType.ADMIN.equals(getContextUser().getUserType()))
			return "management";

		return INPUT;
	}
}
