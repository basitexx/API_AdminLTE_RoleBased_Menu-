using ProjectAPI.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ProjectAPI.Controller
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class menuListController : ApiController
    {
        public class menu
        {
            /* we will create menumaster model property to pass all the information we need */

            public string parent;
            public string ClassCss;
            public string fileName;
            public string url;

            public List<string> child;
            public List<string> style;
            public List<string> cUrl;
            public List<string> cFileName;
            public menu(string p, string pS, string Url, string file, List<string> c, List<string> s, List<string> u, List<string> f)
            {
                parent = p;
                ClassCss = pS;
                fileName = file;
                url = Url;
                
                child = new List<string>();
                style = new List<string>();
                cUrl = new List<string>();
                cFileName = new List<string>();

                foreach (string cs in c)
                {
                    child.Add(cs);
                }
                foreach (string st in s)
                {
                    style.Add(st);
                }
                foreach (string ur in u)
                {
                    cUrl.Add(ur);
                }
                foreach (string fl in f)
                {
                    cFileName.Add(fl);
                }
            }
        }

        public class UserInfo
        {
            public string UserID { get; set; }
        }

        public HttpResponseMessage Get([FromUri] UserInfo userInfo)
        {

            object data = null;
            data = LoadTable1Data(userInfo.UserID);

            string jsonData = JsonConvert.SerializeObject(data);
            //string jsonData = GetJsonFromSomewhere();
            var response = this.Request.CreateResponse(HttpStatusCode.OK);
            response.Content = new StringContent(jsonData, Encoding.UTF8, "application/json");
            return response;

            //return jsonData;
            //context.Response.Write(jsonData);
        }

        public List<menu> LoadTable1Data(string uInfo)
        {      
            //get menu list for userID

            List<string> child = new List<string>();
            List<string> style = new List<string>();
            List<string> cUrl = new List<string>(); ;
            List<string> cFileName = new List<string>(); ;

            List<menu> menuResult = new List<menu>();

            string parent = "", ClassCss = "", url="", fileName =""; 

            RoleAdminEntities context = new RoleAdminEntities();
            //fnGetMenuList_Result menuItem = new fnGetMenuList_Result();
            List<fnGetUserMenuList_Result> menuList = new List<fnGetUserMenuList_Result>();

            menuList = context.fnGetUserMenuList(uInfo).ToList();

            foreach (fnGetUserMenuList_Result MenuItem in menuList)
            {
                //check parent status to decide if root
                //clear child place - holders
                child.Clear(); style.Clear(); cUrl.Clear(); cFileName.Clear();
                
                if (MenuItem.ParentID == null) // means root
                {
                    parent = MenuItem.Title;
                    ClassCss = MenuItem.ClassCss;
                    url = MenuItem.URL;
                    fileName = MenuItem.FileName;

                    // populate children
                    List<fnGetUserMenuList_Result> cildList = /*(List<fnGetMenuList_Result>)*/(from m in menuList where m.ParentID == MenuItem.ID select m).ToList();

                    foreach (fnGetUserMenuList_Result MenuChild in cildList)
                    {
                        child.Add(MenuChild.Title); // and the rest, link, style etc i.e. what's necessary for frontEnd
                        style.Add(MenuChild.ClassCss);
                        cUrl.Add(MenuChild.URL);
                        cFileName.Add(MenuChild.FileName); 
                    }

                    // add to the menuList to be sent       
                    menuResult.Add(new menu(parent, ClassCss,url, fileName, child, style, cUrl, cFileName));
                }                                        
            }

            /*
                List<T1> list = new List<T1>();
                List<string> ch = new List<string>();
                List<string> st = new List<string>();

                string parent = uInfo, ClassCss = "blue";
                ch.Add("Register");
                ch.Add("Refer");

                st.Add("red");
                st.Add("green");

                list.Add(new T1(parent, ClassCss, ch, st));

                parent = "Doctor"; ClassCss = "blue";
                ch.Clear(); st.Clear();
                ch.Add("Treat");
                ch.Add("Order");

                st.Add("red");
                st.Add("green");
                list.Add(new T1(parent, ClassCss, ch, st));
                //////////////
                parent = "Lab"; ClassCss = "blue";
                ch.Clear(); st.Clear();
                ch.Add("Send Result");
                ch.Add("Sample Register");

                st.Add("red");
                st.Add("green");
                list.Add(new T1(parent, ClassCss, ch, st));
                ///////////
                parent = "Ultrasound"; ClassCss = "blue";
                ch.Clear(); st.Clear();
                ch.Add("Register order");
                ch.Add("Send result");

                st.Add("red");
                st.Add("green");
                list.Add(new T1(parent, ClassCss, ch, st));
                //list.Add(new T1("Patient", "Register", "Refer")); // fill T1 object with row data
                */
            return menuResult;
        }
    }
}
