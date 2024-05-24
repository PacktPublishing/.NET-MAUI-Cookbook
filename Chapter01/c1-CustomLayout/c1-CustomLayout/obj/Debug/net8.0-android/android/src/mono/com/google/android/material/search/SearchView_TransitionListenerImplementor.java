package mono.com.google.android.material.search;


public class SearchView_TransitionListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.google.android.material.search.SearchView.TransitionListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onStateChanged:(Lcom/google/android/material/search/SearchView;Lcom/google/android/material/search/SearchView$TransitionState;Lcom/google/android/material/search/SearchView$TransitionState;)V:GetOnStateChanged_Lcom_google_android_material_search_SearchView_Lcom_google_android_material_search_SearchView_TransitionState_Lcom_google_android_material_search_SearchView_TransitionState_Handler:Google.Android.Material.Search.SearchView/ITransitionListenerInvoker, Xamarin.Google.Android.Material\n" +
			"";
		mono.android.Runtime.register ("Google.Android.Material.Search.SearchView+ITransitionListenerImplementor, Xamarin.Google.Android.Material", SearchView_TransitionListenerImplementor.class, __md_methods);
	}


	public SearchView_TransitionListenerImplementor ()
	{
		super ();
		if (getClass () == SearchView_TransitionListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Google.Android.Material.Search.SearchView+ITransitionListenerImplementor, Xamarin.Google.Android.Material", "", this, new java.lang.Object[] {  });
		}
	}


	public void onStateChanged (com.google.android.material.search.SearchView p0, com.google.android.material.search.SearchView.TransitionState p1, com.google.android.material.search.SearchView.TransitionState p2)
	{
		n_onStateChanged (p0, p1, p2);
	}

	private native void n_onStateChanged (com.google.android.material.search.SearchView p0, com.google.android.material.search.SearchView.TransitionState p1, com.google.android.material.search.SearchView.TransitionState p2);

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
