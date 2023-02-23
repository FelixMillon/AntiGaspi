using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Intranet
{
    public partial class FileManagement : Page
    {
        public FileManagementModel Model { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Model = new FileManagementModel();
            Model.LoadFiles();

            if (Request.QueryString["action"] == "delete")
            {
                string fileName = Request.Form["fileName"];
                Model.DeleteFile(fileName);
                Response.Redirect(Request.Url.PathAndQuery);
            }
            else if (Request.QueryString["action"] == "modify")
            {
                string fileName = Request.Form["fileName"];
                HttpPostedFile postedFile = Request.Files["fileUpload"];
                Model.ModifyFile(fileName, postedFile);
                Response.Redirect(Request.Url.PathAndQuery);
            }
            else if (Request.Files["fileUpload"] != null)
            {
                HttpPostedFile postedFile = Request.Files["fileUpload"];
                Model.UploadFile(postedFile);
                Response.Redirect(Request.Url.PathAndQuery);
            }
        }
    }

    public class FileManagementModel
    {
        private const string FileDirectory = "~/Files/";

        public List<string> FileNames { get; set; }

        public void LoadFiles()
        {
            string directory = HttpContext.Current.Server.MapPath(FileDirectory);
            Directory.CreateDirectory(directory);

            FileNames = Directory.GetFiles(directory).Select(f => Path.GetFileName(f)).ToList();
        }

        public void UploadFile(HttpPostedFile file)
        {
            if (file == null || file.ContentLength == 0)
            {
                throw new ArgumentException("Le fichier est vide ou n'a pas été envoyé");
            }

            string directory = HttpContext.Current.Server.MapPath(FileDirectory);
            string fileName = Path.GetFileName(file.FileName);
            string path = Path.Combine(directory, fileName);

            if (File.Exists(path))
            {
                throw new ArgumentException("Un fichier avec ce nom existe déjà");
            }

            file.SaveAs(path);
        }

        public void ModifyFile(string fileName, HttpPostedFile file)
        {
            if (file == null || file.ContentLength == 0)
            {
                throw new ArgumentException("Le fichier est vide ou n'a pas été envoyé");
            }

            string directory = HttpContext.Current.Server.MapPath(FileDirectory);
            string filePath = Path.Combine(directory, fileName);

            if (!File.Exists(filePath))
            {
                throw new ArgumentException("Le fichier n'existe pas");
            }

            string newFilePath = Path.Combine(directory, Path.GetFileName(file.FileName));

            if (File.Exists(newFilePath))
            {
                throw new ArgumentException("Un fichier avec ce nom existe déjà");
            }

            File.Delete(filePath);
            file.SaveAs(newFilePath);
        }

        public void DeleteFile(string fileName)
        {
            string directory = HttpContext.Current.Server.MapPath(FileDirectory);
            string filePath = Path.Combine(directory, fileName);

            if (!File.Exists(filePath))
            {
                throw new ArgumentException("Le fichier n'existe pas");
            }

            File.Delete(filePath);
        }
    }
}
