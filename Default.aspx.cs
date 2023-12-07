using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    int startIndex;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["StartIndex"] = 0;
            CBF110020_PreviousButton.Enabled = false;
            Session["score"] = 0;
        }
        CBF110020_input.Focus();
    }


    protected void CBF110020_PreviousButton_Click(object sender, EventArgs e)
    {
        startIndex = (int)Session["StartIndex"];
        startIndex -= 10;
        Session["StartIndex"] = startIndex;
        if (startIndex == 0)
        {
            CBF110020_PreviousButton.Enabled = false;
        }
        CBF110020_NextButton.Enabled = true;
    }

    protected void CBF110020_NextButton_Click(object sender, EventArgs e)
    {
        startIndex = (int)Session["StartIndex"];
        startIndex += 10;
        Session["StartIndex"] = startIndex;
        if (startIndex >= CBF110020_GV1.Rows.Count * (CBF110020_GV1.PageCount - 1))
        {
            CBF110020_NextButton.Enabled = false;
        }
        CBF110020_PreviousButton.Enabled = true;
    }




    protected void CBF110020_DDL1_SelectedIndexChanged(object sender, EventArgs e)
    {
        CBF110020_cambridge.Text += ($"<a href='https://dictionary.cambridge.org/dictionary/english-chinese-simplified/{CBF110020_DDL1.SelectedItem}'>{CBF110020_DDL1.SelectedItem}</a> => {CBF110020_DDL1.SelectedValue} <br />");
    }

    protected void CBF110020_GV1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        CBF110020_DDL1.DataBind();
    }
    static int index;
    static List<int> rand;
    protected void CBF110020_testBtn_Click(object sender, EventArgs e)
    {
        CBF110020_MV1.ActiveViewIndex = 1;
        Random random = new Random();
        List<int> rnd = new List<int>(Enumerable.Range(0, CBF110020_DDL1.Items.Count));
        rnd = rnd.OrderBy(num => random.Next()).ToList<int>();
        rand = rnd;
        index = 0;
        CBF110020_ch_hint.Text = CBF110020_DDL1.Items[rand[index]].Value;
        formatText(CBF110020_DDL1.Items[rand[index]].Text);
        index += 1;
    }

    protected void CBF110020_nextQBtn_Click(object sender, EventArgs e)
    {
        if (index <= CBF110020_DDL1.Items.Count)
        {
            if (CBF110020_input.Text != CBF110020_DDL1.Items[rand[index - 1]].Text)
            {
                Response.Output.Write($"答錯了!答案是{CBF110020_DDL1.Items[rand[index - 1]].Text}");
            }
            else
            {
                Response.Output.Write("答對了");
                int score = (int)Session["score"];
                score += 10;
                Session["score"] = score;
            }
        }
        if (index <= CBF110020_DDL1.Items.Count - 1)
        {
            CBF110020_ch_hint.Text = CBF110020_DDL1.Items[rand[index]].Value;
            formatText(CBF110020_DDL1.Items[rand[index]].Text);
        }
        else if (index == 10)
        {
            int score = (int)Session["score"];
            Response.Output.Write($"總得分:{score}");
            CBF110020_ch_hint.Text = null;
            CBF110020_input.Visible = false;
            CBF110020_nextQBtn.Text = "結束";
            Response.Output.Write("<a href='http://localhost:52697/Default.aspx'>重玩</a>");
        }
        else
        {
            Response.Clear();
            Controls.Clear();
        }
        index += 1;
    }

    private void formatText(string text)
    {
        CBF110020_input.Text = text.Substring(0, 1) + new string('_', text.Length - 1);
    }

}
