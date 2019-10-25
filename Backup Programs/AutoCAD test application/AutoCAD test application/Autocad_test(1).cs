using Autodesk.AutoCAD.ApplicationServices;
using Autodesk.AutoCAD.DatabaseServices;
using Autodesk.AutoCAD.EditorInput;
using Autodesk.AutoCAD.Geometry;
using Autodesk.AutoCAD.Runtime;
using System;
using System.Diagnostics;
using System.Threading;
using System.Runtime.InteropServices;
using Excel = Microsoft.Office.Interop.Excel;
using System.Linq;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Collections;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AutoCAD_test_application
{
    /// <summary>
    /// House object for Modules, Orientation and Pitch
    /// </summary>
    public class House
    {
        private object[,] modules;
        private object[,] orientation;
        private object[,] pitch;

        public object[,] Modules
        {
            get
            {
                return this.modules;
            }
            set
            {
                this.modules = value;
            }
        }
        public object[,] Orientation
        {
            get
            {
                return this.orientation;
            }
            set
            {
                this.orientation = value;
            }
        }
        public object[,] Pitch
        {
            get
            {
                return this.pitch;
            }
            set
            {
                this.pitch = value;
            }
        }
    }
    public class Autocad_test
    {
        /// <summary>
        /// Set the view back to Top
        /// </summary>
        [CommandMethod("topnow")]
        public void actest()
        {
            //Establish AutoCAD drawing 
            Document acdoc = Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument;
            Database acCurrentDatabase = acdoc.Database;

            //Establish the current drawing editor
            Editor ed = acdoc.Editor;

            //Access the current drawing modelspace
            using (Transaction acTransaction = acCurrentDatabase.TransactionManager.StartTransaction())
            {
                //Create a new Vector3D object and set it to the top
                Vector3d viewdir = new Vector3d();
                viewdir = Vector3d.ZAxis;

                //Access the current view record
                using (ViewTableRecord view = ed.GetCurrentView())
                {
                    //Set the current view to the top
                    view.ViewDirection = viewdir;
                    ed.SetCurrentView(view);

                    //Execute current actions on the model space
                    acTransaction.Commit();
                }
            }
        }


        /// <summary>
        /// Get three ranges of information from Excel. These ranges are the Module roof names, Orientation roof names and Pitch roof names
        /// </summary>
        /// <param name="excelSheet">The sheet in the Excel template you want to look in</param>
        /// <param name="excelCells1">The first range you want to get</param>
        /// <param name="excelCells2">The second range you want to get</param>
        /// <param name="excelCells3">The third range you want to get</param>
        /// <returns>return an Object array with three ranges from Excel representing the Module names, Orientation names and Pitch names</returns>
        public object[,] GetHousecells(string excelSheet, string excelCells1, string excelCells2, string excelCells3)
        {
            //Get the file explorer path to the folder in the current dwg file in the data type of an Object
            Object path = Autodesk.AutoCAD.ApplicationServices.Application.GetSystemVariable("DWGPREFIX");

            //Get the path to the Excel template
            string path1 = path.ToString();
            string path2 = "\\ACAD CALC TEMPLATE.xlsx";
            string excelFile = path1 + path2;

            //Open up the Excel file to your specific input sheet 
            Excel.Application newExcel = new Excel.Application();
            Excel.Workbook excelWorkbook = newExcel.Workbooks.Open(excelFile, Type.Missing, false, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, true, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            Excel.Worksheet currSheet = excelWorkbook.Sheets.Item[excelSheet];
            currSheet.Activate();

            //Get Module range 
            Excel.Range moduleRange = currSheet.Range[excelCells1, System.Type.Missing];

            //Get Orientation range
            Excel.Range orientationRange = currSheet.Range[excelCells2, System.Type.Missing];

            //Get Pitch range
            Excel.Range pitchRange = currSheet.Range[excelCells3, System.Type.Missing];

            //Make a House object for the roof Module names, roof Orientation name and roof Pitch names
            House newHouse = new House();

            //Set roof parater arrays to House variables
            newHouse.Modules = moduleRange.Cells.Value;
            newHouse.Orientation = orientationRange.Cells.Value;
            newHouse.Pitch = pitchRange.Cells.Value;

            //Make an array or arrays to return one value
            object[,] cellsnow = { { newHouse.Modules }, { newHouse.Orientation }, { newHouse.Pitch } };

            //Save and close the Excel file
            excelWorkbook.Save();
            excelWorkbook.Close(true);
            newExcel.Quit();

            //Return the array of arrays
            return cellsnow;
        }


        /// <summary>
        /// Gets values from Excel
        /// </summary>
        /// <param name="excelSheet">The sheet in the Excel template you want to look in</param>
        /// <param name="excelCells">The specific Cell in the sheet you want to look at</param>
        /// <returns>The value of the cell you look at in the data type of an Object</returns>
        public object[] Getcells(string excelSheet, string excelCells, [Optional] string excelCells2, [Optional] string excelCells3)
        {
            //Get the file explorer path to the folder in the current dwg file in the data type of an Object
            Object path = Autodesk.AutoCAD.ApplicationServices.Application.GetSystemVariable("DWGPREFIX");

            //Get the path to the Excel template
            string path1 = path.ToString();
            string path2 = "ACAD CALC TEMPLATE.xlsx";
            string excelFile = path1 + path2;

            //Open up the Excel file to your specific input sheet 
            Excel.Application newExcel = new Excel.Application();
            Excel.Workbook excelWorkbook = newExcel.Workbooks.Open(excelFile, Type.Missing, false, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, true, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            Excel.Worksheet currSheet = excelWorkbook.Sheets.Item[excelSheet];
            currSheet.Activate();

            //Get the value of the input cell 
            Excel.Range cells = currSheet.Range[excelCells, System.Type.Missing];
            Excel.Range cells1 = currSheet.Range[excelCells2, System.Type.Missing];
            //Excel.Range cells2 = currSheet.Range[excelCells3, System.Type.Missing];

            //Set the values as Objects
            object newvalue1 = cells.Cells.Value;
            object newvalue2 = cells1.Cells.Value;
            //object newvalue3 = cells2.Cells.Value;

            //Make an Object array of the values to return
            object[] cellsnow = { newvalue1, newvalue2 };

            //Save and close the Excel file
            excelWorkbook.Save();
            excelWorkbook.Close(true);
            newExcel.Quit();

            //Return the cell value 
            return cellsnow;
        }


        /// <summary>
        /// Get the roof names from Excel and display them in the AutoCAD command line. The roof names consist of module names, pitch names and orientation names.
        /// </summary>
        [CommandMethod("getcellsnow")]
        public void showgetcells()
        {
            //Start tracking the amount of time it takes for the program to run
            Stopwatch stopwatch = Stopwatch.StartNew();

            //Establish AutoCAD drawing
            Document acdoc = Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument;
            Database acCurrentDatabase = acdoc.Database;

            //Editor for the currrent dwg file
            Editor ed = acdoc.Editor;

            //Get the module, pitch and orientation roof numbers for the customer
            object[,] newvar = GetHousecells("CALCULATIONS", "E120:E128", "F120:F128", "G120:G128");

            //step into the roof information number array
            foreach (object[,] i in newvar)
            {
                //step into each array of modules, orientation and pitch
                foreach (string j in i)
                {
                    //Turn the object into a string so it can be output on the command line
                    string k = j.ToString();

                    //Output the module/orientation/pitch name on the command line
                    ed.WriteMessage(k);

                    //Space for formatting
                    ed.WriteMessage(" ");
                }
                //Carriage return for the next data parameter
                ed.WriteMessage("\n");
            }
            //Stop tracking the amount of time it takes for the program to run
            stopwatch.Stop();

            //Output the time it takes for the program to run on the command line
            ed.WriteMessage(stopwatch.ElapsedMilliseconds.ToString());
        }


        /// <summary>
        /// This command gets the 3Line diagram and places it into the correct place in the drawing
        /// </summary>
        [CommandMethod("3linenow")]
        public void threeline()
        {
            //Establish the AutoCAD drawing
            Document acdoc = Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument;
            Database destDb = acdoc.Database;

            //Editor for current dwg file
            Editor ed = acdoc.Editor;

            //Get the 3line diagram
            try
            {
                //Call insert3line command from AutoCAD command line
                acdoc.SendStringToExecute("insert3line\n", true, false, false);
            }
            //Check to see if the template tag exists
            catch (Autodesk.AutoCAD.Runtime.Exception ex)
            {
                //display dialog box with "template does not exist"
                System.Windows.Forms.MessageBox.Show("template does not exist");
            }

            //Explode 3line diagram
            acdoc.SendStringToExecute("EXPLODE\nBOX\n6270,17496,0\n6952,16894,0\n\n", true, false, false);

            //Erase string block if only 1 string system
            acdoc.SendStringToExecute("erasestring\n", true, false, false);

            //regen ModelSpace
            acdoc.SendStringToExecute("REGEN\n", true, false, false);
        }

        /// <summary>
        /// This inserts the 3line diagram into the 3line diagram box
        /// </summary>
        [CommandMethod("insert3line")]
        public void ins3line()
        {
            //Establish AutoCAD drawing
            Document acdoc = Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument;
            Database acCurrentDatabase = acdoc.Database;

            //Editor for the currrent dwg file
            Editor ed = acdoc.Editor;

            //Get 3line tag and number of electrical-strings from Excel file in the job folder
            object[] excelinfo = Getcells("SMALL TABLES", "D88", "D89");

            //Establish a code-String array for the Excel values
            string[] excelarr = new string[excelinfo.Length];

            //Turn 3line tag and number of electrical-strings from object to string
            for (int i = 0; i < excelarr.Length; i++)
            {
                excelarr[i] = excelinfo[i].ToString();
            }

            //Purge the drawing of all drawing blocks with the 3line tag name
            ed.Command("-purge", "Block", excelarr[0], "NO");

            //make string of template path
            string templatePath = "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES (SUNNOVA)\\" + excelarr[0] + ".dwg";

            //Insert the 3line diagram in the 3line box
            ed.Command("-insert", templatePath, "6952.07,17495.8,0.0", "", "", "");
        }
       
        /// <summary>
        /// This checks whether there is 1 electrical-string on the system and then removes it from the ModelSpace
        /// </summary>
        [CommandMethod("erasestring")]
        public void erstring()
        {
            Document acdoc = Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument;
            Database destDb = acdoc.Database;

            //Editor for the currrent dwg file
            Editor ed = acdoc.Editor;

            //Get 3line tag and number of electrical-strings from Excel file in the job folder
            object[] excelinfo = Getcells("SMALL TABLES", "D88", "D89");

            //Establish a code-String array for the Excel values
            string[] excelarr = new string[excelinfo.Length];

            //Turn 3line tag and number of electrical-strings from object to string
            for (int i = 0; i < excelarr.Length; i++)
            {
                excelarr[i] = excelinfo[i].ToString();
            }

            //Start Transaction in the ModelSpace
            Transaction tr = destDb.TransactionManager.StartTransaction();

            try
            {
                //Open up the BlockTable Database
                BlockTable bTbl = (BlockTable)tr.GetObject(destDb.BlockTableId, OpenMode.ForWrite);

                //Open up the BlockTableRecords within the BlockTable and find the BlockRecord witht he name "string1"
                BlockTableRecord blktblrcd = (BlockTableRecord)tr.GetObject(bTbl["string1"], OpenMode.ForWrite);

                //If the number of electrical-strings is 1 AND there is a block in the ModelSpace named "string1"
                if (excelarr[1] == "1" && blktblrcd.Name == "string1")
                {
                    //Delete the "string1" block
                    blktblrcd.Erase();
                }
            }
            catch
            {
                //nothing
            }

            //Finish Transaction on the ModelSpace
            tr.Commit();
        }

        //[CommandMethod("UPDATEBLOCKSNOW")]
        //public void updateblks()
        //{
           
            

            
        //    Document doc = Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument;

        //    Database db = doc.Database;

        //    Editor ed = doc.Editor;

        //    using (Transaction tr = db.TransactionManager.StartTransaction())
        //    {
        //        TypedValue[] typeval = { new TypedValue(2, "INVERTER DATA SHEET (DYNAMIC)"), new TypedValue(0, "INSERT") };
        //        //typeval.SetValue(new TypedValue((int)DxfCode.BlockName, "INVERTER DATA SHEET (DYNAMIC)");
        //        SelectionFilter selfil = new SelectionFilter(typeval);
        //        PromptSelectionResult psr = ed.SelectAll(selfil);
        //        SelectionSet selset = psr.Value;
                
                
                    
        //            BlockTable bt = (BlockTable)tr.GetObject(db.BlockTableId, OpenMode.ForRead);
        //            BlockTableRecord btrec = (BlockTableRecord)tr.GetObject(bt["INVERTER DATA SHEET (DYNAMIC)"], OpenMode.ForRead);
        //            BlockReference br = (BlockReference)tr.GetObject(btrec.ObjectId, OpenMode.ForWrite);
        //            DynamicBlockReferencePropertyCollection props = br.DynamicBlockReferencePropertyCollection;
        //           // ed.WriteMessage(btrec.Name);
        //           // int i = 0;

        //            foreach (DynamicBlockReferenceProperty prop in props)
        //            {
        //                ed.WriteMessage("\n" + prop.PropertyName);
        //                if (prop.PropertyName == "Visibility1" && !prop.ReadOnly)
        //                {
        //                    object[] values = prop.GetAllowedValues();
        //                    foreach (Object val in values)
        //                    {
        //                        ed.WriteMessage("\n" + prop.Value.ToString());
        //                        if (val.ToString() == "SOLAR EDGE (STANDARD)")
        //                        {
        //                        Autodesk.AutoCAD.ApplicationServices.Application.ShowAlertDialog("hello");
        //                        }
        //                        else
        //                        {
        //                            prop.Value = values[3];

        //                        }
        //                    }
        //                }
        //                else
        //                {
        //                Autodesk.AutoCAD.ApplicationServices.Application.ShowAlertDialog("hello2");
        //                }
        //            }
                
                
                    
               

        //    //BlockTableRecord btr = (BlockTableRecord)tr.GetObject(br.DynamicBlockTableRecord, OpenMode.ForRead);
        //    //foreach (ObjectId id in modelSpace)
        //    //{

        //    //    if (id.ObjectClass == brClass)
        //    //    {


        //    //        //ed.WriteMessage(br.Name.ToString() + "-" + id.ObjectClass.DxfName + "  ");
        //    //        if (br.IsDynamicBlock)
        //    //        {
        //    //            var dynblkref = new ObjectIdCollection();



        //    //            if (blktblrec.Name.ToString() == "INVERTER DATA SHEET (DYNAMIC)")
        //    //            {
        //    //                ed.WriteMessage(blktblrec.Name.ToString() + " ");



        //    //                var bkf = blktblrec.ObjectId;
        //    //                BlockReference blkref = (BlockReference)tr.GetObject(bkf, OpenMode.ForWrite);
        //    //                //ed.WriteMessage(blkref.BlockId + " ");


        //    //                //System.Windows.Forms.MessageBox.Show(br.Name.ToString());
        //    //            }


        //    //        }


        //    //    }
        //    //}
            
        //        tr.Commit();
        //    }
            



        //}
        [CommandMethod("ROTIDNOW")]
        public void RotationId()
        {
            Document doc = Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument;

            Database db = doc.Database;

            Editor ed = doc.Editor;

            TypedValue[] typeval = new TypedValue[1];
            typeval.SetValue(new TypedValue((int)DxfCode.LayerName, "N - ROOF NUMBERS"), 0);

            SelectionFilter filt = new SelectionFilter(typeval);

            PromptSelectionResult selset = ed.SelectAll(filt);

            if (selset.Status == PromptStatus.OK)
            {
                SelectionSet sset = selset.Value;
                using (Transaction tr = doc.TransactionManager.StartTransaction())
                {
                    ObjectId[] idarr = sset.GetObjectIds();
                    foreach (ObjectId obj in idarr)
                    {
                        BlockReference blkref = (BlockReference)tr.GetObject(obj, OpenMode.ForRead);
                        BlockTableRecord btr = (BlockTableRecord)tr.GetObject(blkref.BlockTableRecord, OpenMode.ForWrite);

                        AttributeCollection attcol = blkref.AttributeCollection;
                        foreach (ObjectId attid in attcol)
                        {
                            AttributeReference attref = (AttributeReference)tr.GetObject(attid, OpenMode.ForRead);
                            ed.WriteMessage(attref.BlockName.ToString());
                            ed.WriteMessage(attref.Rotation.ToString());
                            ed.WriteMessage("\n");
                        }
                    }
                    tr.Commit();
                }
            }
        }
        /// <summary>
        /// Get the OCPD amperage from the drawing
        /// </summary>
        /// <param name="key">the key for the overcurrent protection device in DWGPROPS</param>
        /// <returns>the amperage of the OCPD</returns>
        public string getcustomproperty(string key)
        {
            Document doc = Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument;
            Database db = doc.Database;

            DatabaseSummaryInfoBuilder suminfo = new DatabaseSummaryInfoBuilder(db.SummaryInfo);
            IDictionary custProps = suminfo.CustomPropertyTable;
            return (string)custProps[key];
        }
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dynamicBlock"></param>
        /// <returns></returns>
        [CommandMethod("blockstate")]
        public string GetdynamicBlockState2(string dynamicBlock)
        {
            Document doc = Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument;
            Database db = doc.Database;
            Editor ed = doc.Editor;
            //initialize the returned variable
            string blockstate = "";
            using (Transaction tr = db.TransactionManager.StartTransaction())
            {
                //Get all listed Dynamicblocks on the Modelspace
                Point3d firstPoint = new Point3d(6270.1875, 17484, 0.0);
                Point3d secondPoint = new Point3d(6952.0625, 16894.625, 0.0);
                TypedValue[] filterlist = new TypedValue[1];
                filterlist[0] = new TypedValue(2, "`*U*,001 DYNAMIC RACKING BLOCK (REFERANCED)");//this looks for blocks or dynamicblocks, disregard the name in the argument
                SelectionFilter filter = new SelectionFilter(filterlist);
                
                //if it's a 3line dynamicblock
                if(dynamicBlock == "interconnection_Dyn" || dynamicBlock == "solarMainDisconnect_Dyn" || dynamicBlock == "nonFusedDisconnect_Dyn" || dynamicBlock == "productionMeter_Dyn")
                {
                    //select through the 3line window and find the visibility state name
                    PromptSelectionResult res = ed.SelectCrossingWindow(firstPoint, secondPoint, filter);
                    blockstate = blockStatenow(res, dynamicBlock);
                }
                //if it's not a 3line dynamicblock
                else
                {
                    //select through the whole drawing and find the visibility state name
                    PromptSelectionResult res = ed.SelectAll(filter);
                    blockstate = blockStatenow(res, dynamicBlock);
                }       
            }
            //return the dynamicblock visibility state value
            return blockstate;
        }
        [DllImport("acad.exe", CharSet = CharSet.Ansi, CallingConvention = CallingConvention.Cdecl, EntryPoint = "acedCmd")]

        private static extern int acedCmd(System.IntPtr vlist);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="res"></param>
        /// <param name="dynamicBlock"></param>
        /// <returns></returns>
        public string  blockStatenow(PromptSelectionResult res, string dynamicBlock)
        {
            Document doc = Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument;
            Database db = doc.Database;
            Editor ed = doc.Editor;
            string blockStatenow = "";

            using (Transaction tr = db.TransactionManager.StartTransaction())
            {
                SelectionSet select = res.Value;

                //Go through all of the Dynamicblocks
                foreach (ObjectId brid in select.GetObjectIds())
                {
                    BlockReference blkref = (BlockReference)tr.GetObject(brid, OpenMode.ForWrite);
                    //check if it is a Dynamicblock
                    if (blkref.IsDynamicBlock)
                    {
                        BlockTableRecord block = tr.GetObject(blkref.DynamicBlockTableRecord, OpenMode.ForRead) as BlockTableRecord;
                        DynamicBlockReferencePropertyCollection pc = blkref.DynamicBlockReferencePropertyCollection;
                        //go through each property in that specific Dynamicblock
                        if (block.Name.ToString() == dynamicBlock)
                        {
                            foreach (DynamicBlockReferenceProperty prop in pc)
                            {
                                //check to see if it is the Dynamicblock we want

                                //check to see if the property affects the visibility state
                                if (prop.PropertyName == "Visibility1")
                                {
                                    //assign the name of the visibility state to the returned variable
                                    ed.WriteMessage(" ||" + prop.Value.ToString() + "|| ");
                                    blockStatenow = prop.Value.ToString();
                                }
                            }
                        }
                    }                   
                }
                //if (blockStatenow == "" && dynamicBlock == "interconnection_Dyn")
                //{
                //    Dictionary<string, string> BSnow = new Dictionary<string, string>();
                    
                   
                 
                //    System.Windows.Forms.MessageBox.Show("PLEASE INPUT THE INTERCONNECTION NAME!");
                //    Form1 getInterconnection = new Form1();
                //    getInterconnection.Show();
                //    do
                //    {
                //        blockStatenow = "";
                        
                //        if((getInterconnection.textBox1.Text is String) && (getInterconnection.buttonClicked == true))
                //        {
                //            //blockStatenow = getInterconnection.GetInterconnection();
                //            //getInterconnection.Close();
                //        }
                        
                        
                //        //getInterconnection.button1_Click;
                        
                        
                //        //doc.SendStringToExecute("(getstring '\nWHAT IS THE CUSTOM INTERCONNECTION CALLED: ')");
                //        //PromptResult promptRslt;
                //        //PromptStringOptions promptstr = new PromptStringOptions("\nWHAT IS THE CUSTOM INTERCONNECTION CALLED: ");
                //        //promptstr.AllowSpaces = true;
                //        //promptRslt = ed.GetString(promptstr);

                        
                //    } while (getInterconnection.buttonClicked == false);
                //    ed.WriteMessage(" ||" + blockStatenow + "|| ");
                //}
            }
            //return the visibility state name
            return blockStatenow;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="excelSheet1"></param>
        /// <param name="excelSheet2"></param>
        /// <param name="excelCells1"></param>
        /// <param name="excelCells2"></param>
        /// <param name="excelCells3"></param>
        /// <param name="ACcells1"></param>
        /// <param name="ACcells2"></param>
        /// <param name="ACcells3"></param>
        /// <param name="ACcells4"></param>
        /// <param name="ACcells5"></param>
        /// <returns></returns>
        public object[] GetSystemCells(string excelSheet1, string excelSheet2, string excelCells1,  string excelCells2, string excelCells3,string ACcells1, string ACcells2, string ACcells3, string ACcells4, string ACcells5)
        {
            //Get the file explorer path to the folder in the current dwg file in the data type of an Object
            Object path = Autodesk.AutoCAD.ApplicationServices.Application.GetSystemVariable("DWGPREFIX");

            //Get the path to the Excel template
            string path1 = path.ToString();
            string path2 = "ACAD CALC TEMPLATE.xlsx";
            string excelFile = path1 + path2;

            //Open up the Excel file to your specific input sheet 
            Excel.Application newExcel = new Excel.Application();
            Excel.Workbook excelWorkbook = newExcel.Workbooks.Open(excelFile, Type.Missing, false, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, true, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            Excel.Worksheet calcSheet = excelWorkbook.Sheets.Item[excelSheet1];
            Excel.Worksheet ACsheet = excelWorkbook.Sheets.Item[excelSheet2];
            calcSheet.Visible = Excel.XlSheetVisibility.xlSheetVisible;
            calcSheet.Activate();

            //Get the value of the input cell in CALCULATIONS sheet 
            Excel.Range cells = calcSheet.Range[excelCells1, System.Type.Missing];//DC system size
            Excel.Range cells1 = calcSheet.Range[excelCells2, System.Type.Missing];//total modules
            Excel.Range cells1_1 = calcSheet.Range[excelCells3, System.Type.Missing];//module type
            calcSheet.Visible = Excel.XlSheetVisibility.xlSheetHidden;

            //Get the value of the input cell in SMALL TABLES sheet 
            ACsheet.Visible = Excel.XlSheetVisibility.xlSheetVisible;
            ACsheet.Activate();
            Excel.Range cells2 = ACsheet.Range[ACcells1, System.Type.Missing];
            Excel.Range cells3 = ACsheet.Range[ACcells2, System.Type.Missing];
            Excel.Range cells4 = ACsheet.Range[ACcells3, System.Type.Missing];
            Excel.Range cells5 = ACsheet.Range[ACcells4, System.Type.Missing];
            Excel.Range cells6 = ACsheet.Range[ACcells5, System.Type.Missing];
            ACsheet.Visible = Excel.XlSheetVisibility.xlSheetHidden;

            //Set the values as Objects
            object DCsystemsize = cells.Cells.Value;
            object totalmodules = cells1.Cells.Value;
            object moduletype = cells1_1.Cells.Value;
            object ACsystemsize1 = cells2.Cells.Value;
            object ACsystemsize2 = cells3.Cells.Value;
            object ACsystemsize3 = cells4.Cells.Value;
            object ACsystemsize4 = cells5.Cells.Value;
            object ACsystemsize5 = cells6.Cells.Value;

            //Convert AC system size values to integers and add them up
            int AC1 = Convert.ToInt32(ACsystemsize1);
            int AC2 = Convert.ToInt32(ACsystemsize2);
            int AC3 = Convert.ToInt32(ACsystemsize3);
            int AC4 = Convert.ToInt32(ACsystemsize4);
            int AC5 = Convert.ToInt32(ACsystemsize5);
            int totalAC = AC1 + AC2 + AC3 + AC4 + AC5;

            //Convert total AC system size back into an object data type
            object ACsystemsize = totalAC;

            //Make an Object array of the values to return
            object[] Systemcells = { DCsystemsize, totalmodules, moduletype, ACsystemsize};

            //Save and close the Excel file
            excelWorkbook.Save();
            excelWorkbook.Close(true);
            newExcel.Quit();

            //Return the cell value 
            return Systemcells;
        }
        /// <summary>
        /// 
        /// </summary>
        [CommandMethod("UPDATEAPPSNOW")]
        public void updateappsnow()
        {
            //Get OCPD from DWGPROPS
            string OCPD = getcustomproperty("03 overcurruntProtection");

            //Get DC system size, total number of modules, module type, AC system size
            object[] Excelinfo = GetSystemCells("CALCULATIONS", "SMALL TABLES", "B34", "B12", "H7","M32","N32","O32","P32","Q32");

            string[] excelarr = new string[Excelinfo.Length];
            
            for (int i = 0; i < excelarr.Length; i++)
            {                
                excelarr[i] = Excelinfo[i].ToString();
            }

            //Assign values from Excel
            string DCsystemsize = excelarr[0];
            string Totalmodules = excelarr[1];
            string modulesType = excelarr[2];
            string ACsytemsize = excelarr[3];
                        
            //Get racking block state, inverter block state, interconnection block state, main disconnect block state, non-fused disconnect block state, production meter block state
            string racking_state = GetdynamicBlockState2("001 DYNAMIC RACKING BLOCK (REFERANCED)");
            string inverter_state = GetdynamicBlockState2("INVERTER DATA SHEET (DYNAMIC)");
            string interconnection_state = GetdynamicBlockState2("interconnection_Dyn");
            string mainDisconnect_state = GetdynamicBlockState2("solarMainDisconnect_Dyn");
            string nonFusedDisconnect_state = GetdynamicBlockState2("nonFusedDisconnect_Dyn");
            string productionMeter_state = GetdynamicBlockState2("productionMeter_Dyn");

            //place all the information in an array to be processed
            string[] electricalEquipmentArray = { racking_state, modulesType, inverter_state, interconnection_state, mainDisconnect_state, productionMeter_state, nonFusedDisconnect_state, OCPD, DCsystemsize, ACsytemsize, Totalmodules };
            //---------------------------------------------------------------------------------//


            ExcelEquipment(electricalEquipmentArray);


        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="electricalarray"></param>
        public void ExcelEquipment(string[] electricalarray)
        {
            //Get the file explorer path to the folder in the current dwg file in the data type of an Object
            Object path = Autodesk.AutoCAD.ApplicationServices.Application.GetSystemVariable("DWGPREFIX");

            //Get the path to the Excel template
            string path1 = path.ToString();
            string path2 = "ACAD CALC TEMPLATE.xlsx";
            string excelFile = path1 + path2;

            //Open up the Excel file to your specific input sheet 
            Excel.Application newExcel = new Excel.Application();
            Excel.Workbook excelWorkbook = newExcel.Workbooks.Open(excelFile, Type.Missing, false, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, true, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);

            //get revision tag value
            Excel.Worksheet calcSheet = excelWorkbook.Sheets.Item["CALCULATIONS"];
            calcSheet.Visible = Excel.XlSheetVisibility.xlSheetVisible;
            calcSheet.Select(Type.Missing);
            Excel.Range cells = calcSheet.Range["R9", System.Type.Missing];
            string revTag = cells.Cells.Value;
            calcSheet.Visible = Excel.XlSheetVisibility.xlSheetHidden;
            //go to revision list sheet
            Excel.Worksheet revisionSheet = excelWorkbook.Sheets.Item["REVISION LIST"];
            revisionSheet.Select(Type.Missing);
            
            //columns in Excel for the Revision
            string[] alphaArray = { "B", "F", "J", "N", "R", "V", "Z", "AD", "AH", "AL", "AP", "AT", "AX", "BB", "BF" };

            //revision tags
            string[] revisionArray = { "P1", "P2", "P3", "P4", "P5", "R1", "R2", "R3", "R4", "R5", "A1", "A2", "A3", "A4", "A5" };

            //revision rows to place equipment strings
            string[] numberArray = { "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56" };

            //begin equipment placing method
            for(int j = 0; j < 15; j++)
            {
                if(revTag == revisionArray[j])
                {
                    string arrayletter = alphaArray[j];
                    for(int k = 0; k < 11; k++)
                    {
                        //place the information in the correct cell in Excel
                        string currentCell = arrayletter + numberArray[k];
                        Excel.Range currCell = revisionSheet.Range[currentCell, Type.Missing];
                        currCell.Value = electricalarray[k];
                    }
                }
                else
                {

                }
            }
            //Save and close the Excel file
            Excel.Worksheet formSheet = excelWorkbook.Sheets.Item["FORM"];
            formSheet.Select(Type.Missing);
            excelWorkbook.Save();
            excelWorkbook.Close(true);
            newExcel.Quit();
        }
        /// <summary>
        /// 
        /// </summary>
        [CommandMethod("REVLISTNOW")]
        public void revlistnow()
        {
            //Get the file explorer path to the folder in the current dwg file in the data type of an Object
            Object path = Autodesk.AutoCAD.ApplicationServices.Application.GetSystemVariable("DWGPREFIX");

            //Get the path to the Excel template
            string path1 = path.ToString();
            string path2 = "ACAD CALC TEMPLATE.xlsx";
            string excelFile = path1 + path2;

            //Open up the Excel file to your specific input sheet 
            Excel.Application newExcel = new Excel.Application();
            Excel.Workbook excelWorkbook = newExcel.Workbooks.Open(excelFile, Type.Missing, false, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, true, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);

            //get revision tag value
            Excel.Worksheet calcSheet = excelWorkbook.Sheets.Item["CALCULATIONS"];
            calcSheet.Visible = Excel.XlSheetVisibility.xlSheetVisible;
            calcSheet.Select(Type.Missing);
            Excel.Range cells = calcSheet.Range["R9", System.Type.Missing];
            string revTag = cells.Cells.Value;
            calcSheet.Visible = Excel.XlSheetVisibility.xlSheetHidden;

            //go to CURRENT EXCEL ROOFS
            Excel.Worksheet currentexcelSheet = excelWorkbook.Sheets.Item["CURRENT EXCEL ROOFS"];
            currentexcelSheet.Select(Type.Missing);

            //get roof information
            Excel.Range cerRange = currentexcelSheet.Range["K3:N43", Type.Missing];
            cerRange.Copy(Type.Missing);//copy current roof information

            //go to revision list sheet
            Excel.Worksheet revisionSheet = excelWorkbook.Sheets.Item["REVISION LIST"];
            revisionSheet.Select(Type.Missing);

            //set up arrays
            string[] revisionArray = { "A", "E", "I", "M", "Q", "U", "Y", "AC", "AG", "AK", "AO", "AS", "AW", "BA", "BE" };
            string[] revtagArray = { "P1", "P2", "P3", "P4", "P5", "R1", "R2", "R3", "R4", "R5", "A1", "A2", "A3", "A4", "A5" };
            string[] secondrevisonArray = {"D", "H", "L", "P", "T", "X", "AB", "AF", "AJ", "AN", "AR", "AV", "AZ", "BD", "BH"};

            //go through the revision tag array
            for (int i = 0; i < 15; i++)
            {
                if (revTag == revtagArray[i])//check to see if the current element is equal to the current revision tag
                {
                    string revisionPlace = revisionArray[i] + "3";
                    Excel.Range revisionCell = revisionSheet.Range[revisionPlace, Type.Missing];
                    revisionCell.PasteSpecial(Excel.XlPasteType.xlPasteValues);//paste current roof information in the correct place
                    break;
                }
            }

            //Save and close the Excel file
            Excel.Worksheet formSheet = excelWorkbook.Sheets.Item["FORM"];
            formSheet.Select(Type.Missing);
            excelWorkbook.Save();
            excelWorkbook.Close(true);
            newExcel.Quit();
        }
    }    

   
}
