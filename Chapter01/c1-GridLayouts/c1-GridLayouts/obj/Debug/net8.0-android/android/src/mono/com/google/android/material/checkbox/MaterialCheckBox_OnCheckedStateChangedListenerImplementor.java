package mono.com.google.android.material.checkbox;


public class MaterialCheckBox_OnCheckedStateChangedListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.google.android.material.checkbox.MaterialCheckBox.OnCheckedStateChangedListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onCheckedStateChangedListener:(Lcom/google/android/material/checkbox/MaterialCheckBox;I)V:GetOnCheckedStateChangedListener_Lcom_google_android_material_checkbox_MaterialCheckBox_IHandler:Google.Android.Material.CheckBox.MaterialCheckBox/IOnCheckedStateChangedListenerInvoker, Xamarin.Google.Android.Material\n" +
			"";
		mono.android.Runtime.register ("Google.Android.Material.CheckBox.MaterialCheckBox+IOnCheckedStateChangedListenerImplementor, Xamarin.Google.Android.Material", MaterialCheckBox_OnCheckedStateChangedListenerImplementor.class, __md_methods);
	}


	public MaterialCheckBox_OnCheckedStateChangedListenerImplementor ()
	{
		super ();
		if (getClass () == MaterialCheckBox_OnCheckedStateChangedListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Google.Android.Material.CheckBox.MaterialCheckBox+IOnCheckedStateChangedListenerImplementor, Xamarin.Google.Android.Material", "", this, new java.lang.Object[] {  });
		}
	}


	public void onCheckedStateChangedListener (com.google.android.material.checkbox.MaterialCheckBox p0, int p1)
	{
		n_onCheckedStateChangedListener (p0, p1);
	}

	private native void n_onCheckedStateChangedListener (com.google.android.material.checkbox.MaterialCheckBox p0, int p1);

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
