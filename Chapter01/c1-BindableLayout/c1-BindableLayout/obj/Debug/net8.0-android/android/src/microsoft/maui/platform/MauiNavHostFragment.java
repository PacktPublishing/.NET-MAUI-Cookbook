package microsoft.maui.platform;


public class MauiNavHostFragment
	extends androidx.navigation.fragment.NavHostFragment
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"";
		mono.android.Runtime.register ("Microsoft.Maui.Platform.MauiNavHostFragment, Microsoft.Maui", MauiNavHostFragment.class, __md_methods);
	}


	public MauiNavHostFragment ()
	{
		super ();
		if (getClass () == MauiNavHostFragment.class) {
			mono.android.TypeManager.Activate ("Microsoft.Maui.Platform.MauiNavHostFragment, Microsoft.Maui", "", this, new java.lang.Object[] {  });
		}
	}

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
