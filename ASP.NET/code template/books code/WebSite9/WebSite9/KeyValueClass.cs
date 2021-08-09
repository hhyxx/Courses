/// <summary>
/// 帮助类KeyValueClass的定义，其对象存储一个WebSiteName：WebSiteUrl
/// 的键值对，被添加至作为数据源的ArrayList中
/// </summary>
using System;
public class KeyValueClass
{
    private String WebSiteName;
    private String WebSiteUrl;
    
    public String Name
    {
        get { return WebSiteName; }
        set { WebSiteName = value; }
    }
    public String Url
    {
        get { return WebSiteUrl; }
        set { WebSiteUrl = value; }
    }
    public KeyValueClass(String name, String url)
    {
        this.WebSiteName = name;
        this.WebSiteUrl = url;
    }
}
