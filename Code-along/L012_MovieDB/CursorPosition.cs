using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieDB
{
    internal class CursorPosition : IDisposable
    {
        private int originalLeft;
        private int originalTop;
        private bool originalVisibility;
        private ConsoleColor originalBackground;
        private ConsoleColor originalForeground;

        public CursorPosition(int left, int top)
        {
            originalForeground = Console.ForegroundColor;
            originalBackground = Console.BackgroundColor;
            (originalLeft, originalTop) = Console.GetCursorPosition();
            originalVisibility = Console.CursorVisible;
            Console.CursorVisible = false;
            Console.SetCursorPosition(left, top);
        }

        public void Dispose()
        {
            Console.SetCursorPosition(originalLeft, originalTop);
            Console.CursorVisible = originalVisibility;
            Console.ForegroundColor = originalForeground;
            Console.BackgroundColor = originalBackground;
        }
    }
}
