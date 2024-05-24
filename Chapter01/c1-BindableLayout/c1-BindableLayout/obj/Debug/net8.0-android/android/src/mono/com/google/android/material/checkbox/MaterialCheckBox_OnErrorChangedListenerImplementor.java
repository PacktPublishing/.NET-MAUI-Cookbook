package mono.com.google.android.material.checkbox;


public class MaterialCheckBox_OnErrorChangedListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.google.android.material.checkbox.MaterialCheckBox.OnErrorChangedListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onErrorChanged:(Lcom/google/android/material/checkbox/MaterialCheckBox;Z)V:GetOnErrorChanged_Lcom_google_android_material_checkbox_MaterialCheckBox_ZHandler:Google.Android.Material.CheckBox.MaterialCheckBox/IOnErrorChangedListenerInvoker, Xamarin.Google.Android.Material\n" +
			"";
		mono.android.Runtime.register ("Google.Android.Material.CheckBox.MaterialCheckBox+IOnErrorChangedListenerImplementor, Xamarin.Google.Android.Material", MaterialCheckBox_OnErrorChangedListenerImplementor.class, __md_methods);
	}


	public MaterialCheckBox_OnErrorChangedListenerImplementor ()
	{
		super ();
		if (getClass () == MaterialCheckBox_OnErrorChangedListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Google.Android.Material.CheckBox.MaterialCheckBox+IOnErrorChangedListenerImplementor, Xamarin.Google.Android.Material", "", this, new java.lang.Object[] {  });
		}
	}


	public void onErrorChanged (com.google.android.material.checkbox.MaterialCheckBox p0, boolean p1)
	{
		n_onErrorChanged (p0, p1);
	}

	private native void n_onErrorChanged (com.google.android.material.checkbox.MaterialCheckBox p0, boolean p1);

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
