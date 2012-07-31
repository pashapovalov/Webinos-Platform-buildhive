// BondiFeatureParam.h : Declaration of the CBondiFeatureParam

#pragma once
#ifdef STANDARDSHELL_UI_MODEL
#include "resource.h"
#endif
#ifdef POCKETPC2003_UI_MODEL
#include "resourceppc.h"
#endif
#ifdef SMARTPHONE2003_UI_MODEL
#include "resourcesp.h"
#endif
#ifdef AYGSHELL_UI_MODEL
#include "resourceayg.h"
#endif

#include "package.h"


#if defined(_WIN32_WCE) && !defined(_CE_DCOM) && !defined(_CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA)
#error "Single-threaded COM objects are not properly supported on Windows CE platform, such as the Windows Mobile platforms that do not include full DCOM support. Define _CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA to force ATL to support creating single-thread COM object's and allow use of it's single-threaded COM object implementations. The threading model in your rgs file was set to 'Free' as that is the only threading model supported in non DCOM Windows CE platforms."
#endif



// CBondiFeatureParam

class ATL_NO_VTABLE CBondiFeatureParam :
	public CComObjectRootEx<CComMultiThreadModel>,
	public CComCoClass<CBondiFeatureParam, &CLSID_BondiFeatureParam>,
	public ISupportErrorInfo,
	public IDispatchImpl<IBondiFeatureParam, &IID_IBondiFeatureParam, &LIBID_packageLib, /*wMajor =*/ 1, /*wMinor =*/ 0>
{
private:
	_bstr_t m_name;
	_bstr_t m_value;

public:
	CBondiFeatureParam()
	{
	}

#ifndef _CE_DCOM
DECLARE_REGISTRY_RESOURCEID(IDR_BONDIFEATUREPARAM)
#endif


BEGIN_COM_MAP(CBondiFeatureParam)
	COM_INTERFACE_ENTRY(IBondiFeatureParam)
	COM_INTERFACE_ENTRY(IDispatch)
	COM_INTERFACE_ENTRY(ISupportErrorInfo)
END_COM_MAP()

// ISupportsErrorInfo
	STDMETHOD(InterfaceSupportsErrorInfo)(REFIID riid);


	DECLARE_PROTECT_FINAL_CONSTRUCT()

	HRESULT FinalConstruct()
	{
		return S_OK;
	}

	void FinalRelease()
	{
	}

	void parse(MSXML2::IXMLDOMNodePtr paramNode);

public:
	STDMETHOD(get_Name)(BSTR* pVal);
	STDMETHOD(put_Name)(BSTR newVal);
	STDMETHOD(get_Value)(BSTR* pVal);
	STDMETHOD(put_Value)(BSTR newVal);
};

OBJECT_ENTRY_AUTO(__uuidof(BondiFeatureParam), CBondiFeatureParam)
