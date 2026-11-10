using System;
using System.Diagnostics;
using System.IO;
using System.Web;

namespace PAP.Login.Filters
{
    /// <summary>
    /// Shared logger used by action and result filters.
    /// </summary>
    internal static class RequestLog
    {
        public static void Write(string message)
        {
            var line = string.Format("{0:yyyy-MM-dd HH:mm:ss.fff} | {1}", DateTime.Now, message);
            Trace.WriteLine(line);
            Debug.WriteLine(line);

            try
            {
                var folder = HttpContext.Current.Server.MapPath("~/App_Data/logs");
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                File.AppendAllText(Path.Combine(folder, "requests.log"), line + Environment.NewLine);
            }
            catch
            {
                // Never break the request because logging failed.
            }
        }
    }
}
